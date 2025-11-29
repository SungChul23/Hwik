// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'dart:io';

// ---- WAV helpers ----
bool _isWav(Uint8List b) =>
    b.length > 12 &&
    String.fromCharCodes(b.sublist(0, 4)) == 'RIFF' &&
    String.fromCharCodes(b.sublist(8, 12)) == 'WAVE';

bool _isWebm(Uint8List b) =>
    b.length > 4 &&
    b[0] == 0x1A &&
    b[1] == 0x45 &&
    b[2] == 0xDF &&
    b[3] == 0xA3;

bool _isMp4(Uint8List b) =>
    b.length >= 12 && String.fromCharCodes(b.sublist(4, 8)) == 'ftyp';

int _le32(Uint8List b, int o) =>
    b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24);
int _le16(Uint8List b, int o) => b[o] | (b[o + 1] << 8);

class _WavChunks {
  int fmtOffset = -1;
  int fmtSize = 0;
  int dataOffset = -1;
  int dataSize = 0;
}

_WavChunks _scanWavChunks(Uint8List bytes) {
  final c = _WavChunks();
  int p = 12;
  while (p + 8 <= bytes.length) {
    final id = String.fromCharCodes(bytes.sublist(p, p + 4));
    final size = _le32(bytes, p + 4);
    final next = p + 8 + size + (size.isOdd ? 1 : 0); // padding 처리
    if (id == 'fmt ') {
      c.fmtOffset = p + 8;
      c.fmtSize = size;
    }
    if (id == 'data') {
      c.dataOffset = p + 8;
      c.dataSize = size;
      break;
    }
    p = next;
  }
  return c;
}

Map<String, int> _readWavFmt(Uint8List b, _WavChunks c) {
  if (c.fmtOffset < 0)
    return {'channels': 1, 'sampleRate': 16000, 'bitsPerSample': 16};
  final off = c.fmtOffset;
  return {
    'channels': _le16(b, off + 2),
    'sampleRate': _le32(b, off + 4),
    'bitsPerSample': _le16(b, off + 14),
  };
}

// 안전한 WAV 16bit stereo → mono 다운믹스
Uint8List _downmixStereoToMonoPcm16Safe(Uint8List wav) {
  if (!_isWav(wav)) return wav;
  final bytes = Uint8List.fromList(wav);
  final chunks = _scanWavChunks(bytes);
  if (chunks.fmtOffset < 0 || chunks.dataOffset < 0) return bytes;

  final fmt = _readWavFmt(bytes, chunks);
  final ch = fmt['channels'] ?? 1;
  final bits = fmt['bitsPerSample'] ?? 16;
  if (ch == 1 || bits != 16) return bytes;

  final dataStart = chunks.dataOffset;
  final dataEnd = dataStart + chunks.dataSize;
  if (dataEnd > bytes.length) return bytes;

  final stereo = bytes.sublist(dataStart, dataEnd);
  final frames = stereo.length ~/ 4; // 16bit x 2ch = 4 bytes per frame
  final mono = BytesBuilder();

  for (int i = 0; i < frames; i++) {
    final li = i * 4;
    final ri = li + 2;
    final l = stereo[li] | (stereo[li + 1] << 8);
    final r = stereo[ri] | (stereo[ri + 1] << 8);
    int ls = (l & 0x8000) != 0 ? l - 0x10000 : l;
    int rs = (r & 0x8000) != 0 ? r - 0x10000 : r;
    int m = ((ls + rs) ~/ 2);
    if (m < -32768) m = -32768;
    if (m > 32767) m = 32767;
    final u = (m < 0) ? (m + 0x10000) : m;
    mono.add([u & 0xFF, (u >> 8) & 0xFF]);
  }
  final monoBytes = mono.toBytes();

  // 헤더 갱신
  void w16(int o, int v) {
    bytes[o] = v & 0xFF;
    bytes[o + 1] = (v >> 8) & 0xFF;
  }

  void w32(int o, int v) {
    bytes[o] = v & 0xFF;
    bytes[o + 1] = (v >> 8) & 0xFF;
    bytes[o + 2] = (v >> 16) & 0xFF;
    bytes[o + 3] = (v >> 24) & 0xFF;
  }

  // fmt: channels=1, byteRate/blockAlign 절반
  w16(chunks.fmtOffset + 2, 1);
  final oldByteRate = _le32(bytes, chunks.fmtOffset + 8);
  final oldAlign = _le16(bytes, chunks.fmtOffset + 12);
  w32(chunks.fmtOffset + 8, oldByteRate ~/ 2);
  w16(chunks.fmtOffset + 12, oldAlign ~/ 2);

  // data size 갱신 및 파일 재조립
  final pre = bytes.sublist(0, chunks.dataOffset);
  final post = bytes.sublist(chunks.dataOffset + chunks.dataSize);
  final out = BytesBuilder();
  out.add(pre);
  out.add(monoBytes);
  out.add(post);
  final outBytes = out.toBytes();

  // data chunk size
  final newSize = monoBytes.length;
  outBytes[chunks.dataOffset - 4] = newSize & 0xFF;
  outBytes[chunks.dataOffset - 3] = (newSize >> 8) & 0xFF;
  outBytes[chunks.dataOffset - 2] = (newSize >> 16) & 0xFF;
  outBytes[chunks.dataOffset - 1] = (newSize >> 24) & 0xFF;
  // RIFF size = fileSize - 8
  final riffSize = outBytes.length - 8;
  outBytes[4] = riffSize & 0xFF;
  outBytes[5] = (riffSize >> 8) & 0xFF;
  outBytes[6] = (riffSize >> 16) & 0xFF;
  outBytes[7] = (riffSize >> 24) & 0xFF;

  return outBytes;
}

Future<String> readAudioAndConvertToB64(String? audioPath) async {
  if (audioPath == null || audioPath.isEmpty) {
    print('❌ readAudioAndConvertToB64: audioPath empty');
    return '';
  }

  List<int> bytes;
  try {
    if (kIsWeb) {
      print('🌐 Web: fetch blob (300ms) → $audioPath');
      await Future.delayed(const Duration(milliseconds: 300));
      final res = await http.get(Uri.parse(audioPath));
      if (res.statusCode != 200) {
        print('❌ blob fetch failed: ${res.statusCode}');
        return '';
      }
      bytes = res.bodyBytes;
    } else {
      print('📱 Mobile: read file → $audioPath');
      final f = File(audioPath);
      if (!await f.exists()) {
        print('❌ file not found');
        return '';
      }
      bytes = await f.readAsBytes();
    }

    if (bytes.isEmpty) {
      print('❌ bytes empty');
      return '';
    }

    final u = Uint8List.fromList(bytes);

    if (_isWav(u)) {
      final chunksB = _scanWavChunks(u);
      final metaB = _readWavFmt(u, chunksB);
      print(
          '🔎 WAV before: ch=${metaB['channels']}, sr=${metaB['sampleRate']}, bits=${metaB['bitsPerSample']}');

      final mono = _downmixStereoToMonoPcm16Safe(u);
      final chunksA = _scanWavChunks(mono);
      final metaA = _readWavFmt(mono, chunksA);
      print('✅ WAV after: ch=${metaA['channels']}, sr=${metaA['sampleRate']}');

      bytes = mono;
    } else if (_isWebm(u)) {
      print('🔎 Detected WEBM/OPUS');
    } else if (_isMp4(u)) {
      print('❗ Detected MP4/AAC (Google STT v1 미지원)');
      // 원하면 여기서 빈값 반환하여 STT 시도 자체를 막을 수도 있음.
      // return '';
    } else {
      print('❓ Unknown container');
    }

    final b64 = base64Encode(bytes);
    print('✅ toB64 length=${b64.length}');
    return b64;
  } catch (e) {
    print('❌ readAudioAndConvertToB64 error: $e');
    return '';
  }
}

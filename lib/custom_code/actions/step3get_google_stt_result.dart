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
import 'package:http/http.dart' as http;
import 'dart:typed_data'; // Uint8List, BytesBuilder 등

/// Return type: JSON
Future<dynamic> step3getGoogleSttResult(
  BuildContext context, // 👈 [필수] Include BuildContext 체크
  String base64Audio,
  String googleSttToken,
  // primaryLanguageCode, alternativeLanguageCode 파라미터 제거
) async {
  // ── 기본 검증
  if (base64Audio.isEmpty) {
    print('❌ [STT] base64Audio empty');
    return {'transcript': 'STT_AUDIO_EMPTY', 'languageCode': 'error'};
  }
  if (googleSttToken.isEmpty) {
    print('❌ [STT] token empty');
    return {'transcript': 'STT_TOKEN_EMPTY', 'languageCode': 'error'};
  }

  // ── 헬퍼
  bool isWav(Uint8List b) =>
      b.length > 12 &&
      String.fromCharCodes(b.sublist(0, 4)) == 'RIFF' &&
      String.fromCharCodes(b.sublist(8, 12)) == 'WAVE';

  bool isWebm(Uint8List b) =>
      b.length > 4 &&
      b[0] == 0x1A &&
      b[1] == 0x45 &&
      b[2] == 0xDF &&
      b[3] == 0xA3;

  bool isMp4(Uint8List b) =>
      b.length >= 12 && String.fromCharCodes(b.sublist(4, 8)) == 'ftyp';

  int le32(Uint8List b, int o) =>
      b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24);
  int le16(Uint8List b, int o) => b[o] | (b[o + 1] << 8);

  int findFmtOffset(Uint8List b) {
    int p = 12;
    while (p + 8 <= b.length) {
      final id = String.fromCharCodes(b.sublist(p, p + 4));
      final size = le32(b, p + 4);
      if (id == 'fmt ') return p + 8;
      p += 8 + size + (size.isOdd ? 1 : 0);
    }
    return -1;
  }

  Map<String, int> readWavMeta(Uint8List b) {
    final fmt = findFmtOffset(b);
    if (fmt < 0 || fmt + 16 > b.length) {
      return {
        'channels': le16(b, 22),
        'sampleRate': le32(b, 24),
        'bitsPerSample': le16(b, 34),
      };
    }
    return {
      'channels': le16(b, fmt + 2),
      'sampleRate': le32(b, fmt + 4),
      'bitsPerSample': le16(b, fmt + 14),
    };
  }

  // ── 데이터 처리
  final cleaned = base64Audio.replaceFirst(
    RegExp(r'^data:audio/[^;]+;base64,', caseSensitive: false),
    '',
  );
  Uint8List rawBytes;
  try {
    rawBytes = base64Decode(cleaned);
  } catch (e) {
    print('❌ [STT] base64 decode error: $e');
    return {'transcript': 'STT_BASE64_DECODE_ERROR', 'languageCode': 'error'};
  }
  print('📦 [STT] bytes length = ${rawBytes.length}');

  // ── config 생성
  final Map<String, dynamic> configMap = {
    'languageCode': 'ja-JP',
    'alternativeLanguageCodes': [],
    'enableAutomaticPunctuation': true,
    'model': 'default',
  };

  if (isWav(rawBytes)) {
    final meta = readWavMeta(rawBytes);
    final sr = meta['sampleRate'] ?? 16000;
    final ch = meta['channels'] ?? 1;
    print('🔎 [STT] Detected WAV: sr=$sr, ch=$ch');

    configMap['encoding'] = 'LINEAR16';
    configMap['sampleRateHertz'] = sr;
    configMap['audioChannelCount'] = ch;
  } else if (isWebm(rawBytes)) {
    print('🔎 [STT] Detected WEBM/OPUS');
    configMap['encoding'] = 'WEBM_OPUS';
    configMap.remove('sampleRateHertz');
  } else if (isMp4(rawBytes)) {
    print('❌ [STT] Detected MP4/AAC → Google STT v1 미지원');
    return {'transcript': 'STT_UNSUPPORTED_MP4', 'languageCode': 'error'};
  } else {
    print('❌ [STT] Unknown container');
    return {'transcript': 'STT_UNKNOWN_CONTAINER', 'languageCode': 'error'};
  }

  // ── 요청
  final Map<String, dynamic> bodyMap = {
    'config': configMap,
    'audio': {'content': cleaned}
  };
  final String body = jsonEncode(bodyMap);
  print('🟦 [STT req body] $body');

  http.Response resp;
  String raw = '';
  try {
    resp = await http.post(
      Uri.parse('https://speech.googleapis.com/v1/speech:recognize'),
      headers: {
        'Authorization': 'Bearer $googleSttToken',
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: body,
    );
    raw = utf8.decode(resp.bodyBytes);
  } catch (e) {
    print('❌ [STT] HTTP post failed: $e');
    FFAppState().sttErrorLog = '--- HTTP Error ---\n$e';
    return {'transcript': 'STT_HTTP_ERROR', 'languageCode': 'error'};
  }

  print('🟩 [STT resp] status=${resp.statusCode}');

  if (resp.statusCode != 200) {
    FFAppState().sttErrorLog = '--- API Error Response ---\n$raw';
    return {'transcript': 'STT_API_ERROR', 'languageCode': 'error'};
  }

  // ✅ 📍 [UX 개선] 분석 중 스낵바 (무한 대기 + 로딩 아이콘 + 상단 배치)
  if (context.mounted) {
    String userNickname = FFAppState().nickname;
    if (userNickname.isEmpty) {
      userNickname = '회원';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // 👇 [핵심] Row를 써서 텍스트와 로딩 아이콘을 가로로 배치
        content: Row(
          children: [
            // 뺑글이 (흰색)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16), // 간격
            // 안내 멘트
            Expanded(
              child: Text(
                '$userNickname님의 목소리를 분석하고 있어요...\n(잠시만 기다려주세요)',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blueAccent, // 진행 중(파랑)
        // 👇 [핵심] 시간을 1시간으로 설정하여 결과 올 때까지 안 꺼지게 함
        duration: const Duration(hours: 1),
        // 👇 [핵심] 화면 바닥에서 150px만큼 띄워서 상단에 배치
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  FFAppState().sttErrorLog = '--- Success! Response ---\n$raw';

  // ── 파싱
  Map<String, dynamic> data;
  try {
    data = jsonDecode(raw) as Map<String, dynamic>;
  } catch (e) {
    print('❌ [STT] JSON decode error: $e');
    return {'transcript': 'STT_PARSE_ERROR', 'languageCode': 'error'};
  }

  final List results = (data['results'] as List?) ?? const [];
  if (results.isEmpty) {
    print('⚠️ [STT] Empty results');
    return {'transcript': '', 'languageCode': 'ja-JP'};
  }

  final Map<String, dynamic> first = results.first as Map<String, dynamic>;
  final List alts = (first['alternatives'] as List?) ?? const [];
  final String transcript = alts.isNotEmpty
      ? ((alts.first as Map<String, dynamic>)['transcript']?.toString() ?? '')
      : '';

  String lang = first['languageCode']?.toString() ?? 'ja-JP';
  if (lang.contains('-')) {
    final p = lang.split('-');
    if (p.length == 2) lang = '${p[0].toLowerCase()}-${p[1].toUpperCase()}';
  }

  print('✅ [STT parsed] transcript="$transcript"');
  print('✅ [STT parsed] languageCode="$lang"');

  return {'transcript': transcript, 'languageCode': lang};
}

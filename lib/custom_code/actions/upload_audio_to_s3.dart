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
import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
// [!!] dart:io 와 kIsWeb 는 더 이상 필요 없으므로 제거해도 됩니다.
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:io' as io;

Future<dynamic> uploadAudioToS3(
  String uploadUrl,
  String uuid,
  String base64Audio,
) async {
  try {
    // [!!] 'audio/mp4' (속임수) 헤더를 사용합니다.
    final contentType = 'audio/mp4';
    print('🎤 Uploading with Content-Type: $contentType');

    Uint8List audioBytes;

    // [!!] 'stopRecord'가 이미 Base64 문자열을 주므로,
    // [!!] 복잡한 kIsWeb/io.File 로직이 모두 필요 없어졌습니다.
    // [!!] 바로 Base64 디코딩을 수행합니다.
    try {
      audioBytes = base64.decode(base64Audio);
    } catch (e) {
      print('❌ Invalid Base64 data: $e');
      return {'status': 'error', 'message': 'Invalid Base64 data'};
    }

    if (audioBytes.isEmpty) {
      print('❌ Empty audio data after decode.');
      return {'status': 'error', 'message': 'Empty audio data'};
    }

    print('✅ Audio loaded: ${audioBytes.lengthInBytes} bytes');

    // ✅ S3 PUT 업로드 (기존 코드와 동일)
    final response = await http.put(
      Uri.parse(uploadUrl),
      headers: {
        'Content-Type': contentType,
        'uuid': uuid, // [!!] 사용자님의 기존 로직 (uuid 헤더) 포함
      },
      body: audioBytes,
    );

    print('✅ S3 - Upload complete: ${response.statusCode}');
    return {
      'status': response.statusCode == 200 ? 'success' : 'failed',
      'code': response.statusCode,
      'body': response.body.isNotEmpty ? response.body : 'empty',
    };
  } catch (e) {
    print('⚠️ Upload Error: $e');
    return {'status': 'error', 'message': e.toString()};
  }
}

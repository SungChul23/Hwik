// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'dart:js' as js; // ✅ F12 콘솔 출력용

Future<dynamic> pollUntilReady(
  String jobId, // ✅ 이제 checkUrl 대신 jobId만 받음
  int intervalSec,
  int maxTries,
  String uuid,
) async {
  const baseUrl =
      'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/tasks/';

  try {
    final fullUrl = '$baseUrl$jobId'; // ✅ URL 자동 연결
    print('🧭 [pollUntilReady] checkUrl: $fullUrl (uuid: $uuid)');

    for (int i = 0; i < maxTries; i++) {
      print('🔎 [poll] ${i + 1}/$maxTries 요청: $fullUrl');

      final res = await http.get(
        Uri.parse(fullUrl),
        headers: {
          'Accept': 'application/json',
          'uuid': uuid,
        },
      );

      if (res.statusCode == 200) {
        if (res.body.isEmpty) {
          print('⚠️ 서버 응답 Body가 비어있음');
          return {'status': 200, 'body': 'empty'};
        }

        try {
          final decoded = jsonDecode(res.body);
          print('✅ 결과 도착');
          return decoded;
        } catch (e) {
          print('⚠️ JSON 파싱 실패: $e');
          print('📜 Response Body:\n${res.body}');
          return {'status': 200, 'rawBody': res.body};
        }
      }

      if (res.statusCode == 202) {
        print('⏳ 처리 중... ${i + 1}/$maxTries');
        await Future.delayed(Duration(seconds: intervalSec));
        continue;
      }

      print('⚠️ 예외 응답: ${res.statusCode}');
      print('📜 Response Body:\n${res.body}');
      return {'status': res.statusCode, 'body': res.body};
    }

    print('❌ 최대 시도 횟수 초과 또는 실패');
    return {'status': 'timeout'};
  } catch (e) {
    print('🚨 오류 발생: $e');
    return {'status': 'error', 'message': e.toString()};
  }
}

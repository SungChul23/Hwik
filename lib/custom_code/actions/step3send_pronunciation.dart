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
import 'package:web_socket_channel/web_socket_channel.dart';
// 'connectWebSocket.dart' 파일 안에 'globalChannel' 변수가 선언되어 있어야 합니다.
import '/custom_code/actions/connect_web_socket.dart'; // ✅ getter import

/// [Step 3 전용] STT 결과를 AWS 서버로 전송합니다 (Pronunciation)
Future<void> step3sendPronunciation(
  String jobId,
  String sttResult,
  // ⭐️ 'detectedLanguage' 파라미터 제거됨
) async {
  // connectWebSocket.dart 에 있는 전역 채널(globalChannel)을 가져옵니다.
  final channel = globalChannel;

  // 채널이 연결되어 있는지 확인합니다.
  if (channel == null || channel.closeCode != null) {
    print('⚠️ [step3sendPronunciation] 채널이 연결되어 있지 않습니다. 메시지를 보낼 수 없습니다.');
    return;
  }

  try {
    // 1. 서버에 보낼 JSON 메시지 구성
    final Map<String, dynamic> message = {
      "action": "processPronunciation",
      "jobId": jobId,
      "sttResult": sttResult,
      // ⭐️ 'detectedLanguage' 필드 제거됨
    };

    // 2. JSON 문자열로 변환
    final jsonMsg = jsonEncode(message);

    print('📤 [processPronunciation] 메시지 전송: $jsonMsg');

    // 3. AWS 웹소켓으로 메시지 전송
    channel.sink.add(jsonMsg);

    print('✅ [processPronunciation] STT 결과 전송 완료');
  } catch (e) {
    print('❌ [step3sendPronunciation] 메시지 전송 실패: $e');
  }
}

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
import '/custom_code/actions/connect_web_socket.dart'; // ✅ globalChannel getter import
import 'package:web_socket_channel/web_socket_channel.dart';

/// 🎤 [Step 3 전용] requestStream 메시지 전송 (단순 쉐도잉용)
Future<void> step3sendRequestStreamMessage(
  // 👈 함수 이름 변경됨
  BuildContext context,
  String videoId,
  String langCode,
  String themeId,
  // ⭐️ Step 4와 달리 modelAnswerScript 등이 빠짐
) async {
  try {
    // ✅ WebSocket 연결 확인
    if (globalChannel == null) {
      print('⚠️ [step3sendRequestStreamMessage] WebSocket이 아직 연결되지 않았습니다.');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: const Text('⚠️ [Step3] WebSocket이 아직 연결되지 않았습니다.'),
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: Colors.orange,
      //     duration: Duration(seconds: 2),
      //   ),
      // );
      return;
    }

    print('🎤 [step3sendRequestStreamMessage] 요청 시작');

    // 1️⃣ 전송할 메시지 구성 (⭐️ Step 3 용으로 단순화)
    final Map<String, dynamic> contextData = {
      "langCode": langCode,
      "videoId": videoId,
      "themeId": themeId,
    };

    final Map<String, dynamic> message = {
      "action": "requestStream",
      "fileExtension": "m4a", // 기존과 동일하게 m4a
      "context": contextData,
    };

    // 2️⃣ 서버로 메시지 전송
    final jsonMsg = jsonEncode(message);
    print('📤 [step3sendRequestStreamMessage] $jsonMsg');
    globalChannel!.sink.add(jsonMsg);

    // ✅ 전송 성공 Snackbar
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('📡 [Step3] requestStream 메시지 전송 완료!'),
    //
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.blueAccent,
    //     duration: Duration(seconds: 2),
    //   ),
    // );
  } catch (e) {
    print('❌ [step3sendRequestStreamMessage] 오류: $e');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('❌ [Step3] 메시지 전송 실패: $e'),
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.red,
    //   ),
    // );
  }
}

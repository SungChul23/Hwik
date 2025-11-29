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

// [!!] 이전에 만든 connectWebSocket.dart 파일을 import합니다.
// 파일 이름이 다르다면 이 경로를 수정해야 합니다.
import '/custom_code/actions/connect_web_socket.dart';

Future<void> disconnectWebSocket() async {
  // connectWebSocket.dart에 정의된 전역 채널(globalChannel)을 가져옵니다.
  final channel = globalChannel;

  // 채널이 존재하고, 아직 닫히지 않았다면 닫기 요청을 보냅니다.
  if (channel != null && channel.closeCode == null) {
    print('🔌 [WebSocket] 연결을 닫습니다.');
    try {
      await channel.sink.close(1000, 'User left page');
      print('✅ [WebSocket] Disconnect signal sent.');
    } catch (e) {
      print('❌ [WebSocket] Disconnect error: $e');
    }
  } else {
    print('ℹ️ [WebSocket] Already disconnected or not initialized.');
  }

  // `connectWebSocket`의 onDone 핸들러가 AppState를 업데이트하지만,
  // 만약의 경우를 대비해 여기서도 AppState를 업데이트합니다.
  if (FFAppState().isConnected) {
    FFAppState().update(() {
      FFAppState().isConnected = false;
    });
  }
}

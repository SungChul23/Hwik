// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

// 이 코드를 그대로 복사해서 붙여넣으세요.

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' show Platform; // Android/iOS 플랫폼 확인용

Future<String?> getFCMToken() async {
  // FirebaseMessaging 인스턴스를 가져옵니다.
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // iOS 또는 Android에서 알림 권한을 요청합니다.
  // 이 코드가 FlutterFlow의 'Ask for Permission' 액션을 대체합니다.
  if (Platform.isIOS || Platform.isAndroid) {
    try {
      await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      print('알림 권한 요청 실패: $e');
      // 권한 요청에 실패해도 토큰은 가져올 수 있으므로 계속 진행합니다.
    }
  }

  // 기기의 FCM 토큰을 가져옵니다.
  try {
    String? token = await messaging.getToken();
    print('FCM Token: $token'); // 테스트 시 콘솔에서 토큰 확인용
    return token;
  } catch (e) {
    print('FCM 토큰 가져오기 실패: $e');
    return null; // 실패 시 null 반환
  }
}

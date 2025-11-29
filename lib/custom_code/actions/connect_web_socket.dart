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
// ❌ 삭제: import 'package:web_socket_channel/io.dart'; (WASM 호환 불가)
// ❌ 삭제: import 'package:flutter/foundation.dart' show kIsWeb;

// 전역 WebSocketChannel 변수
WebSocketChannel? _channel;

// 외부에서 WebSocket 채널에 접근할 수 있도록 getter 제공
WebSocketChannel? get globalChannel => _channel;

Future<void> connectWebSocket(
  BuildContext context,
  String url,
  String uuid,
) async {
  // 이미 연결되어 있다면 중복 실행 방지
  if (_channel != null && FFAppState().isConnected) {
    print('🔌 WebSocket이 이미 연결되어 있습니다.');
    return;
  }

  try {
    print('🔌 웹소켓 연결 시도... URL: $url');
    print('🧾 UUID: $uuid');

    final Uri uri = Uri.parse('$url?user_uuid=$uuid');

    // ✅ [수정] WASM/Web/Mobile 통합 연결 방식
    // io.dart 없이 WebSocketChannel.connect 하나만 쓰면
    // 라이브러리가 알아서 플랫폼(Web, Native)을 판별해 연결합니다.
    _channel = WebSocketChannel.connect(uri);

    // App State 업데이트
    FFAppState().update(() {
      FFAppState().isConnected = true;
    });
    print('✅ 웹소켓 연결 성공: $uri');

    // 리스너 등록
    _channel!.stream.listen(
      (message) {
        print('📩 [WebSocket] 서버 메시지 수신: $message');

        try {
          final dynamic decoded = jsonDecode(message);
          if (decoded is! Map<String, dynamic>) {
            print('⚠️ 예상과 다른 메시지 형식');
            return;
          }
          final data = decoded;
          final String action = data['action']?.toString() ?? '';

          // 1) streamReady
          if (action == 'streamReady') {
            final jobId = data['jobId']?.toString() ?? '';
            final uploadUrl = data['uploadUrl']?.toString() ?? '';
            final googleSttToken = data['googleSttToken']?.toString() ?? '';

            FFAppState().update(() {
              FFAppState().jobId = jobId;
              FFAppState().uploadUrl = uploadUrl;
              FFAppState().googleSttToken = googleSttToken;
            });

            print('🧩 jobId 저장: $jobId');
            print('📦 uploadUrl 저장: $uploadUrl');
            print('🔑 googleSttToken 저장: $googleSttToken');
          }

          // 2) finalResult
          else if (action == 'finalResult') {
            final resultData = data['data'] as Map<String, dynamic>?;

            if (resultData != null) {
              final String resultType =
                  resultData['resultType']?.toString() ?? '';

              int? parsedStar;
              final feedback = resultData['feedback'];
              if (feedback is Map<String, dynamic>) {
                final sr = feedback['star_rating'];
                if (sr is num) {
                  parsedStar = sr.toInt();
                } else if (sr is String) {
                  parsedStar = int.tryParse(sr);
                }
              }

              FFAppState().update(() {
                FFAppState().finalResultData = resultData;
                FFAppState().step4FeedbackOn = true;
                FFAppState().step4ResultType = resultType;
                if (parsedStar != null) {
                  FFAppState().starCounting = parsedStar!;
                }
              });

              print('🎉 (Step 4) 최종 결과 수신: $resultData');

              if (context.mounted) {
                String userNickname = FFAppState().nickname;
                if (userNickname.isEmpty) userNickname = '회원';

                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('🎉 $userNickname님의 최종 평가 결과가 도착했어요!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 150,
                      left: 20,
                      right: 20,
                    ),
                  ),
                );
              }
            }
          }

          // [STEP 3] pronuncationResult
          else if (action == 'pronunciationResult') {
            final resultData = data['data'] as Map<String, dynamic>?;

            if (resultData != null) {
              FFAppState().update(() {
                FFAppState().step3PronunciationData = resultData;
                FFAppState().step3FeedbackOn = true;
              });

              print('🗣️ [Step 3] 발음 평가 결과 수신: $resultData');

              if (context.mounted) {
                String userNickname = FFAppState().nickname;
                if (userNickname.isEmpty) userNickname = '회원';

                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('🗣️ $userNickname님의 발음 평가 결과가 도착했어요!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 150,
                      left: 20,
                      right: 20,
                    ),
                  ),
                );
              }
            }
          } else {
            if (data.containsKey('error')) {
              print('⚠️ [WebSocket] 서버 에러: ${data['error']}');
            }
          }
        } catch (err) {
          print('⚠️ 메시지 파싱 오류: $err');
        }
      },
      onDone: () {
        print('❎ WebSocket 연결 종료됨');
        FFAppState().update(() {
          FFAppState().isConnected = false;
        });
        _channel = null;
      },
      onError: (error) {
        print('⚠️ WebSocket 오류: $error');
        FFAppState().update(() {
          FFAppState().isConnected = false;
        });
        _channel = null;
      },
    );
  } catch (e) {
    print('❌ 소켓 연결 실패: $e');
    FFAppState().update(() {
      FFAppState().isConnected = false;
    });
    _channel = null;
  }
}

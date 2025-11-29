// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

/// 🍎 iOS Web 여부 체크
bool get _isIOSWeb => kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

class CustomReelsPlayer extends StatefulWidget {
  final double? width;
  final double? height;
  final String videoUrl;
  final bool isVisible; // 현재 PageView에서 보이는지
  final bool forcePause; // 마이크 녹음 등으로 외부에서 강제 정지

  const CustomReelsPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
    required this.isVisible,
    required this.forcePause,
  }) : super(key: key);

  @override
  _CustomReelsPlayerState createState() => _CustomReelsPlayerState();
}

class _CustomReelsPlayerState extends State<CustomReelsPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  // 🤖 / 💻 안드로이드 & PC용 전역 mute 상태 (세션 전체 공유)
  // 기본: 소리 켜진 상태로 시작
  static bool _globalMuted = false;

  // 🎧 이 "한 영상"의 실제 mute 상태
  late bool _isMuted;

  // 🍎 iOS용 안내 문구 표시 여부 (iOS Web 에서만 true로 시작)
  bool _showIOSHint = _isIOSWeb;

  @override
  void initState() {
    super.initState();

    // iOS Web → 이 영상은 항상 무음으로 시작
    // 그 외 → 전역 상태를 따라감
    _isMuted = _isIOSWeb ? true : _globalMuted;

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        if (!mounted) return;

        // 초기 볼륨 설정
        _controller.setVolume(_isMuted ? 0.0 : 1.0);

        setState(() {});

        if (widget.isVisible && !widget.forcePause) {
          _controller.play();
          _controller.setLooping(true);
          _isPlaying = true;
        }
      });

    _controller.addListener(() {
      if (mounted) setState(() {});
    });

    // 🍎 iOS 정책 안내 문구는 3초 뒤 자동 숨김
    if (_isIOSWeb) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() => _showIOSHint = false);
        }
      });
    }
  }

  @override
  void didUpdateWidget(CustomReelsPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 안드/PC에서는 전역 mute 상태를 이 인스턴스에 동기화
    if (!_isIOSWeb) {
      _isMuted = _globalMuted;
    }

    // 🎤 forcePause true로 바뀐 경우 (녹음 시작 등)
    if (widget.forcePause && !oldWidget.forcePause) {
      if (_controller.value.isPlaying) {
        _controller.pause();
        setState(() {
          _isPlaying = false;
        });
      }
    }
    // 🎤 forcePause false로 바뀐 경우 (녹음 종료 등)
    else if (!widget.forcePause && oldWidget.forcePause) {
      if (widget.isVisible && !_controller.value.isPlaying) {
        _controller.setVolume(_isMuted ? 0.0 : 1.0);
        _controller.play();
        setState(() {
          _isPlaying = true;
        });
      }
    }
    // 👀 PageView 스크롤로 isVisible 변경
    else if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        if (!widget.forcePause) {
          _controller.setVolume(_isMuted ? 0.0 : 1.0);
          _controller.play();
          _controller.setLooping(true);
          setState(() {
            _isPlaying = true;
          });
        }
      } else {
        _controller.pause();
        _controller.seekTo(Duration.zero);
        setState(() {
          _isPlaying = false;
        });
      }
    }
  }

  void _togglePlayPause() {
    // forcePause 상태에서는 유저가 재생 누르지 못하게 막기 (정지는 허용)
    if (widget.forcePause && !_controller.value.isPlaying) return;

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
      HapticFeedback.lightImpact();
    });
  }

  void _toggleMute() {
    setState(() {
      if (_isIOSWeb) {
        // 🍎 iOS Web → 이 "한 영상"에만 적용
        // 다음 영상은 다시 무음으로 시작
        _isMuted = !_isMuted;
      } else {
        // 🤖 / 💻 그 외 → 전역 상태로 공유
        _globalMuted = !_globalMuted;
        _isMuted = _globalMuted;
      }

      _controller.setVolume(_isMuted ? 0.0 : 1.0);

      // iOS에서 소리 버튼을 눌렀으면 힌트는 바로 숨김
      if (_isIOSWeb) {
        _showIOSHint = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (!_controller.value.isInitialized) {
      if (!widget.isVisible) {
        return Container(
          width: widget.width ?? screenWidth,
          height: widget.height ?? screenHeight,
          color: Colors.black,
        );
      }
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFE84C10),
        ),
      );
    }

    return SizedBox(
      width: widget.width ?? screenWidth,
      height: widget.height ?? screenHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🎬 영상 (탭 → 재생/일시정지)
          GestureDetector(
            onTap: _togglePlayPause,
            behavior: HitTestBehavior.opaque,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: IgnorePointer(
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
          ),

          // 🔊 소리 버튼 + 🍎 iOS 안내 문구
          Positioned(
            top: 50,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _toggleMute,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isMuted ? Icons.volume_off : Icons.volume_up,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),
                if (_isIOSWeb && _showIOSHint)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "iOS 정책으로 자동재생 시 소리가 꺼져 있어요.\n🔊 아이콘을 눌러\n소리를 켜 주세요!",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        height: 1.25,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // 🕒 진행 바
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                final box = context.findRenderObject() as RenderBox?;
                if (box != null) {
                  final pos = details.localPosition.dx / box.size.width;
                  final newPos = _controller.value.duration * pos;
                  _controller.seekTo(newPos);
                }
              },
              child: Container(
                height: 14,
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 4,
                      color: Colors.white24,
                    ),
                    FractionallySizedBox(
                      widthFactor:
                          _controller.value.duration.inMilliseconds == 0
                              ? 0
                              : _controller.value.position.inMilliseconds /
                                  _controller.value.duration.inMilliseconds,
                      child: Container(
                        height: 4,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ▶ 일시정지 시 중앙 재생 버튼
          if (!_isPlaying)
            const Center(
              child: Icon(
                Icons.play_arrow,
                size: 80,
                color: Colors.white70,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }
}

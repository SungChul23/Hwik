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

// ✅ 공식 video_player 패키지로 교체 (WASM 호환)
import 'package:video_player/video_player.dart';

class CustomMutedPreviewPlayer extends StatefulWidget {
  final String videoUrl;
  final double? width;
  final double? height;

  const CustomMutedPreviewPlayer({
    Key? key,
    required this.videoUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _CustomMutedPreviewPlayerState createState() =>
      _CustomMutedPreviewPlayerState();
}

class _CustomMutedPreviewPlayerState extends State<CustomMutedPreviewPlayer> {
  // ✅ CachedVideoPlayerPlusController -> VideoPlayerController로 변경
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // ✅ 공식 패키지 초기화 방식
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() => _initialized = true);
          _controller
            ..setLooping(true)
            ..setVolume(0.0) // Muted 설정
            ..play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 로딩 중일 때 보여줄 UI
    if (!_initialized) {
      return Container(
        width: widget.width ?? 150,
        height: widget.height ?? 250,
        color: Colors.grey[300], // 로딩 중 회색 배경
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    // ✅ CachedVideoPlayerPlus -> VideoPlayer 위젯으로 변경
    // 기존의 FittedBox + SizedBox 구조를 유지하여 화면 꽉 차게(Cover) 설정
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: widget.width ?? 150,
        height: widget.height ?? 250,
        child: FittedBox(
          fit: BoxFit.cover, // 숏폼처럼 꽉 차게
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }
}

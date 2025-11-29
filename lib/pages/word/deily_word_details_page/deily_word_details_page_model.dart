import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'deily_word_details_page_widget.dart' show DeilyWordDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DeilyWordDetailsPageModel
    extends FlutterFlowModel<DeilyWordDetailsPageWidget> {
  ///  Local state fields for this page.
  /// 이 단어 본적 있어요 테스트
  bool isTestMode = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}

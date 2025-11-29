import '/flutter_flow/flutter_flow_util.dart';
import 'word_have_seen_page_widget.dart' show WordHaveSeenPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WordHaveSeenPageModel extends FlutterFlowModel<WordHaveSeenPageWidget> {
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

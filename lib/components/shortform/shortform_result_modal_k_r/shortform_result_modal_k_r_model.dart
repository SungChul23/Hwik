import '/flutter_flow/flutter_flow_util.dart';
import 'shortform_result_modal_k_r_widget.dart'
    show ShortformResultModalKRWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ShortformResultModalKRModel
    extends FlutterFlowModel<ShortformResultModalKRWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}

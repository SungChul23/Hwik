import '/flutter_flow/flutter_flow_util.dart';
import 'shortform_result_modal_f_o_widget.dart'
    show ShortformResultModalFOWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ShortformResultModalFOModel
    extends FlutterFlowModel<ShortformResultModalFOWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}

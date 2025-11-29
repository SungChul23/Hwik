import '/flutter_flow/flutter_flow_util.dart';
import 'step4_result_f_o_modal_widget.dart' show Step4ResultFOModalWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Step4ResultFOModalModel
    extends FlutterFlowModel<Step4ResultFOModalWidget> {
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

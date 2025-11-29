import '/flutter_flow/flutter_flow_util.dart';
import 'step3_result_modal_widget.dart' show Step3ResultModalWidget;
import 'package:flutter/material.dart';

class Step3ResultModalModel extends FlutterFlowModel<Step3ResultModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FeedBack_Column widget.
  ScrollController? feedBackColumnScrollController;
  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    feedBackColumnScrollController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    feedBackColumnScrollController?.dispose();
    columnController?.dispose();
  }
}

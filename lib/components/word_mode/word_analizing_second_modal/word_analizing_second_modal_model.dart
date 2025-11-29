import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'word_analizing_second_modal_widget.dart'
    show WordAnalizingSecondModalWidget;
import 'package:flutter/material.dart';

class WordAnalizingSecondModalModel
    extends FlutterFlowModel<WordAnalizingSecondModalWidget> {
  ///  Local state fields for this component.
  /// 결과 나왔냐2
  bool isResultReady2 = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (WordFinalResult)] action in WordAnalizing_Second_modal widget.
  ApiCallResponse? worddetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

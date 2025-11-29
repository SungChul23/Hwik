import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'word_analizing_first_modal_widget.dart'
    show WordAnalizingFirstModalWidget;
import 'package:flutter/material.dart';

class WordAnalizingFirstModalModel
    extends FlutterFlowModel<WordAnalizingFirstModalWidget> {
  ///  Local state fields for this component.
  /// 결과 나왔냐
  bool isResultReady = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Recognition)] action in WordAnalizing_First_modal widget.
  ApiCallResponse? apiResultjcm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

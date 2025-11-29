import '/flutter_flow/flutter_flow_util.dart';
import 'termsof_service_widget.dart' show TermsofServiceWidget;
import 'package:flutter/material.dart';

class TermsofServiceModel extends FlutterFlowModel<TermsofServiceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}

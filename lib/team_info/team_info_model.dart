import '/flutter_flow/flutter_flow_util.dart';
import 'team_info_widget.dart' show TeamInfoWidget;
import 'package:flutter/material.dart';

class TeamInfoModel extends FlutterFlowModel<TeamInfoWidget> {
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

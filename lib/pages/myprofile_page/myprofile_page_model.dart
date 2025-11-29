import '/backend/api_requests/api_calls.dart';
import '/components/good_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'myprofile_page_widget.dart' show MyprofilePageWidget;
import 'package:flutter/material.dart';

class MyprofilePageModel extends FlutterFlowModel<MyprofilePageWidget> {
  ///  Local state fields for this page.
  /// 사진 로딩중
  bool isPictureLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (WordWeeklyHistory)] action in myprofilePage widget.
  ApiCallResponse? wordWeeklyHistory;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for good component.
  late GoodModel goodModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    goodModel = createModel(context, () => GoodModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    tabBarController?.dispose();
    goodModel.dispose();
  }
}

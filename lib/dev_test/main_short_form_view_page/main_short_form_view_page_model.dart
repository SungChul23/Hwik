import '/components/good_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_short_form_view_page_widget.dart' show MainShortFormViewPageWidget;
import 'package:flutter/material.dart';

class MainShortFormViewPageModel
    extends FlutterFlowModel<MainShortFormViewPageWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for VideoView widget.
  PageController? videoViewController;

  int get videoViewCurrentIndex => videoViewController != null &&
          videoViewController!.hasClients &&
          videoViewController!.page != null
      ? videoViewController!.page!.round()
      : 0;
  // Model for good component.
  late GoodModel goodModel;

  @override
  void initState(BuildContext context) {
    goodModel = createModel(context, () => GoodModel());
  }

  @override
  void dispose() {
    goodModel.dispose();
  }
}

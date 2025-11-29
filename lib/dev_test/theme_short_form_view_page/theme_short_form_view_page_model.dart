import '/flutter_flow/flutter_flow_util.dart';
import 'theme_short_form_view_page_widget.dart'
    show ThemeShortFormViewPageWidget;
import 'package:flutter/material.dart';

class ThemeShortFormViewPageModel
    extends FlutterFlowModel<ThemeShortFormViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

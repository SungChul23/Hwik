import '/components/good_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'search_short_form_page_widget.dart' show SearchShortFormPageWidget;
import 'package:flutter/material.dart';

class SearchShortFormPageModel
    extends FlutterFlowModel<SearchShortFormPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // Model for good component.
  late GoodModel goodModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    goodModel = createModel(context, () => GoodModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    tabBarController?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    goodModel.dispose();
  }
}

import '/backend/api_requests/api_calls.dart';
import '/components/good_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'search_short_form_page_model.dart';
export 'search_short_form_page_model.dart';

class SearchShortFormPageWidget extends StatefulWidget {
  const SearchShortFormPageWidget({super.key});

  static String routeName = 'SearchShortFormPage';
  static String routePath = '/searchShortFormPage';

  @override
  State<SearchShortFormPageWidget> createState() =>
      _SearchShortFormPageWidgetState();
}

class _SearchShortFormPageWidgetState extends State<SearchShortFormPageWidget>
    with TickerProviderStateMixin {
  late SearchShortFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchShortFormPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF0A0A0A),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF8C42),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: Color(0x33FFFFFF),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '탐색',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF8C42),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: Color(0x33FFFFFF),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.person,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              Text(
                                FFAppState().nickname,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Stack(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        controller: _model.columnController1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                              'assets/jsons/Fire_animation.json',
                                              width: 45.0,
                                              height: 45.0,
                                              fit: BoxFit.contain,
                                              frameRate: FrameRate(60.0),
                                              animate: true,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '인기 급상승 숏폼',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.notoSans(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().navIndex = 1;
                                                    safeSetState(() {});

                                                    context.goNamed(
                                                        MainShortFormViewPageWidget
                                                            .routeName);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF1A1A1A),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x33FFFFFF),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Text(
                                                        '보러가기',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1A1A1A),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 15.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                              color: Color(0x33FFFFFF),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 250.0,
                                              child: CarouselSlider(
                                                items: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                50.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        topRight:
                                                            Radius.circular(
                                                                50.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 200.0,
                                                        child: custom_widgets
                                                            .CustomMutedPreviewPlayer(
                                                          width: 200.0,
                                                          height: 200.0,
                                                          videoUrl:
                                                              'https://d3oh3i67sd0g28.cloudfront.net/popular_video/popular_video_01.mp4',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                50.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        topRight:
                                                            Radius.circular(
                                                                50.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 200.0,
                                                        child: custom_widgets
                                                            .CustomMutedPreviewPlayer(
                                                          width: 200.0,
                                                          height: 200.0,
                                                          videoUrl:
                                                              'https://d3oh3i67sd0g28.cloudfront.net/popular_video/popular_video_02.mp4',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                50.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        topRight:
                                                            Radius.circular(
                                                                50.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 200.0,
                                                        child: custom_widgets
                                                            .CustomMutedPreviewPlayer(
                                                          width: 200.0,
                                                          height: 200.0,
                                                          videoUrl:
                                                              'https://d3oh3i67sd0g28.cloudfront.net/popular_video/popular_video_03.mp4',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: 1,
                                                  viewportFraction: 0.4,
                                                  disableCenter: true,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.25,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: true,
                                                  autoPlayAnimationDuration:
                                                      Duration(
                                                          milliseconds: 500),
                                                  autoPlayInterval: Duration(
                                                      milliseconds:
                                                          (500 + 2000)),
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 15.0))
                                          .addToStart(SizedBox(height: 30.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Lottie.asset(
                                        'assets/jsons/shortform.json',
                                        width: 45.0,
                                        height: 45.0,
                                        fit: BoxFit.contain,
                                        frameRate: FrameRate(60.0),
                                        animate: true,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '상황별 숏폼으로 학습하기',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 500.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x1AFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            4.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: Color(0x33FFFFFF),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: FlutterFlowButtonTabBar(
                                            useToggleButtonStyle: false,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedLabelColor:
                                                Color(0x80FFFFFF),
                                            backgroundColor: Color(0x1AFFFFFF),
                                            unselectedBackgroundColor:
                                                Color(0x00FFFFFF),
                                            borderWidth: 0.0,
                                            borderRadius: 20.0,
                                            elevation: 0.0,
                                            buttonMargin: EdgeInsets.all(8.0),
                                            padding: EdgeInsets.all(4.0),
                                            tabs: [
                                              Tab(
                                                text: '카페',
                                              ),
                                              Tab(
                                                text: '편의점',
                                              ),
                                              Tab(
                                                text: '레스토랑',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  controller:
                                                      _model.columnController2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '카페에서 음료를 주문하고 대화하는 법을 배워요.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSans(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .mainWhite,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: FFAppState()
                                                              .cafeCashe(
                                                            requestFn: () =>
                                                                ShortFormDetailCall
                                                                    .call(
                                                              uuid: FFAppState()
                                                                  .uuid,
                                                              preferredLanguage:
                                                                  FFAppState()
                                                                      .preferredLanguage,
                                                              themeId: 'cafe',
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final gridViewShortFormDetailResponse =
                                                                snapshot.data!;

                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final cafeVideoList =
                                                                    gridViewShortFormDetailResponse
                                                                        .jsonBody
                                                                        .toList();

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        16.0,
                                                                    mainAxisSpacing:
                                                                        16.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      cafeVideoList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          cafeVideoListIndex) {
                                                                    final cafeVideoListItem =
                                                                        cafeVideoList[
                                                                            cafeVideoListIndex];
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            160.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.network(
                                                                              getJsonField(
                                                                                cafeVideoListItem,
                                                                                r'''$.thumbnailUrl''',
                                                                              ).toString(),
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x26FFFFFF),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0x80000000),
                                                                                        Color(0xCC000000)
                                                                                      ],
                                                                                      stops: [
                                                                                        0.0,
                                                                                        1.0
                                                                                      ],
                                                                                      begin: AlignmentDirectional(0.0, 1.0),
                                                                                      end: AlignmentDirectional(0, -1.0),
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      cafeVideoListItem,
                                                                                      r'''$.title''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Colors.transparent,
                                                                                    Color(0x80000000)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.0, 1.0),
                                                                                  end: AlignmentDirectional(0, -1.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  // 카페전용 숏폼뷰이동

                                                                                  context.pushNamed(
                                                                                    ThemeShortFormViewPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'themeId': serializeParam(
                                                                                        'cafe',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'startIndex': serializeParam(
                                                                                        cafeVideoListIndex,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.play_circle_filled,
                                                                                  color: Colors.white,
                                                                                  size: 75.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cafeVideoListItem,
                                                                                      r'''$.scene["ko-script"]''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cafeVideoListItem,
                                                                                      r'''$.scene["lang-script"]''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          color: Color(0xCCFFFFFF),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation1']!);
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  controller:
                                                      _model.columnController3,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '편의점에서 물건을 찾고 구매해요.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSans(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .mainWhite,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: FFAppState()
                                                              .cVSCashe(
                                                            requestFn: () =>
                                                                ShortFormDetailCall
                                                                    .call(
                                                              uuid: FFAppState()
                                                                  .uuid,
                                                              preferredLanguage:
                                                                  FFAppState()
                                                                      .preferredLanguage,
                                                              themeId: 'cvs',
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final gridViewShortFormDetailResponse =
                                                                snapshot.data!;

                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final cVSVideoList =
                                                                    gridViewShortFormDetailResponse
                                                                        .jsonBody
                                                                        .toList();

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        16.0,
                                                                    mainAxisSpacing:
                                                                        16.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      cVSVideoList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          cVSVideoListIndex) {
                                                                    final cVSVideoListItem =
                                                                        cVSVideoList[
                                                                            cVSVideoListIndex];
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            160.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.network(
                                                                              getJsonField(
                                                                                cVSVideoListItem,
                                                                                r'''$.thumbnailUrl''',
                                                                              ).toString(),
                                                                            ).image,
                                                                          ),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 15.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                6.0,
                                                                              ),
                                                                              spreadRadius: 0.0,
                                                                            )
                                                                          ],
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0x1AFFFFFF),
                                                                              Color(0x0DFFFFFF)
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(1.0, 1.0),
                                                                            end:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x26FFFFFF),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Colors.transparent,
                                                                                    Color(0x80000000)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.0, 1.0),
                                                                                  end: AlignmentDirectional(0, -1.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  // 카페전용 숏폼뷰이동

                                                                                  context.pushNamed(
                                                                                    ThemeShortFormViewPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'themeId': serializeParam(
                                                                                        'cvs',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'startIndex': serializeParam(
                                                                                        cVSVideoListIndex,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.play_circle_filled,
                                                                                  color: Colors.white,
                                                                                  size: 75.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0x80000000),
                                                                                        Color(0xCC000000)
                                                                                      ],
                                                                                      stops: [
                                                                                        0.0,
                                                                                        1.0
                                                                                      ],
                                                                                      begin: AlignmentDirectional(0.0, 1.0),
                                                                                      end: AlignmentDirectional(0, -1.0),
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      cVSVideoListItem,
                                                                                      r'''$.title''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cVSVideoListItem,
                                                                                      r'''$.scene["ko-script"]''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cVSVideoListItem,
                                                                                      r'''$.scene["lang-script"]''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          color: Color(0xCCFFFFFF),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!);
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  controller:
                                                      _model.columnController4,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '음식점에서 메뉴를 추천 받고 주문해요.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSans(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .mainWhite,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: FFAppState()
                                                              .resCashe(
                                                            requestFn: () =>
                                                                ShortFormDetailCall
                                                                    .call(
                                                              uuid: FFAppState()
                                                                  .uuid,
                                                              preferredLanguage:
                                                                  FFAppState()
                                                                      .preferredLanguage,
                                                              themeId:
                                                                  'restaurant',
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final gridViewShortFormDetailResponse =
                                                                snapshot.data!;

                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final restaurantVideoList =
                                                                    gridViewShortFormDetailResponse
                                                                        .jsonBody
                                                                        .toList();

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        16.0,
                                                                    mainAxisSpacing:
                                                                        16.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      restaurantVideoList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          restaurantVideoListIndex) {
                                                                    final restaurantVideoListItem =
                                                                        restaurantVideoList[
                                                                            restaurantVideoListIndex];
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            160.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.network(
                                                                              getJsonField(
                                                                                restaurantVideoListItem,
                                                                                r'''$.thumbnailUrl''',
                                                                              ).toString(),
                                                                            ).image,
                                                                          ),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 15.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                6.0,
                                                                              ),
                                                                              spreadRadius: 0.0,
                                                                            )
                                                                          ],
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0x1AFFFFFF),
                                                                              Color(0x0DFFFFFF)
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(1.0, 1.0),
                                                                            end:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x26FFFFFF),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Colors.transparent,
                                                                                    Color(0x80000000)
                                                                                  ],
                                                                                  stops: [
                                                                                    0.0,
                                                                                    1.0
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0.0, 1.0),
                                                                                  end: AlignmentDirectional(0, -1.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  // 카페전용 숏폼뷰이동

                                                                                  context.pushNamed(
                                                                                    ThemeShortFormViewPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'themeId': serializeParam(
                                                                                        'restaurant',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'startIndex': serializeParam(
                                                                                        restaurantVideoListIndex,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.play_circle_filled,
                                                                                  color: Colors.white,
                                                                                  size: 75.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0x80000000),
                                                                                        Color(0xCC000000)
                                                                                      ],
                                                                                      stops: [
                                                                                        0.0,
                                                                                        1.0
                                                                                      ],
                                                                                      begin: AlignmentDirectional(0.0, 1.0),
                                                                                      end: AlignmentDirectional(0, -1.0),
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      restaurantVideoListItem,
                                                                                      r'''$.title''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          fontSize: 15.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      restaurantVideoListItem,
                                                                                      r'''$.scene["ko-script"]

''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      restaurantVideoListItem,
                                                                                      r'''$.scene["lang-script"]''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          color: Color(0xCCFFFFFF),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation3']!);
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .addToStart(SizedBox(height: 30.0))
                                    .addToEnd(SizedBox(height: 30.0)),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 70.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.goodModel,
                updateCallback: () => safeSetState(() {}),
                child: GoodWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/components/good_widget.dart';
import '/dev_test/step_by_step_modal/step_by_step_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_short_form_view_page_model.dart';
export 'main_short_form_view_page_model.dart';

class MainShortFormViewPageWidget extends StatefulWidget {
  const MainShortFormViewPageWidget({super.key});

  static String routeName = 'MainShortFormViewPage';
  static String routePath = '/mainShortFormViewPage';

  @override
  State<MainShortFormViewPageWidget> createState() =>
      _MainShortFormViewPageWidgetState();
}

class _MainShortFormViewPageWidgetState
    extends State<MainShortFormViewPageWidget> with TickerProviderStateMixin {
  late MainShortFormViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainShortFormViewPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // 웹소캣 연결
      await actions.connectWebSocket(
        context,
        'wss://b8o6pfzw0h.execute-api.us-east-1.amazonaws.com/dev',
        FFAppState().uuid,
      );
      _model.currentPageIndex = _model.videoViewCurrentIndex;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
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
    // On page dispose action.
    () async {
      // 소캣 연결 해체
      await actions.disconnectWebSocket();
      FFAppState().isQuizExpanded = false;
      FFAppState().step3FeedbackOn = false;
      safeSetState(() {});
    }();

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
          backgroundColor: FlutterFlowTheme.of(context).mainBlack,
          body: Stack(
            children: [
              Stack(
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: FFAppState().mainShortFormVideo(
                      requestFn: () => MainShortFormViewCall.call(
                        uuid: FFAppState().uuid,
                        targetLanguage: FFAppState().preferredLanguage,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final videoViewMainShortFormViewResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final feed = MainShortFormViewCall.feed(
                                videoViewMainShortFormViewResponse.jsonBody,
                              )?.toList() ??
                              [];

                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: PageView.builder(
                              controller: _model.videoViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, feed.length - 1))),
                              onPageChanged: (_) async {
                                // 인덱스 순서 일치 -> 영상 설정
                                _model.currentPageIndex =
                                    _model.videoViewCurrentIndex;
                                safeSetState(() {});
                                // 3,4 스텝 피드백 및 결과값 초기화
                                FFAppState().step4FeedbackOn = false;
                                FFAppState().step3PronunciationData = null;
                                FFAppState().finalResultData = null;
                                FFAppState().step4ResultType = '';
                                FFAppState().isQuizExpanded = false;
                                FFAppState().step3FeedbackOn = false;
                                safeSetState(() {});
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: feed.length,
                              itemBuilder: (context, feedIndex) {
                                final feedItem = feed[feedIndex];
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child: custom_widgets.CustomReelsPlayer(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          videoUrl: FeedItemStruct.maybeFromMap(
                                                  feedItem)!
                                              .videoUrl,
                                          isVisible: feedIndex ==
                                                  _model.currentPageIndex
                                              ? true
                                              : false,
                                          forcePause: false,
                                        ),
                                      ),
                                      if (FFAppState().isQuizExpanded == false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 100.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.transparent,
                                                    Color(0x80000000),
                                                    Color(0xCC000000)
                                                  ],
                                                  stops: [0.0, 0.6, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 10.0,
                                                    sigmaY: 10.0,
                                                  ),
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
                                                      HapticFeedback
                                                          .lightImpact();
                                                      FFAppState()
                                                              .isQuizExpanded =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x40000000),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    20.0,
                                                                    24.0,
                                                                    20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '이 숏폼 학습하기',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.notoSans(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '이 장면을 당신의 것으로 만드세요!',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.notoSans(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xCCFFFFFF),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    HapticFeedback
                                                                        .lightImpact();
                                                                    FFAppState()
                                                                            .isQuizExpanded =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x40FFFFFF),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_up,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation']!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().isQuizExpanded == true)
                                        StepByStepModalWidget(
                                          key: Key(
                                              'Keyf1b_${feedIndex}_of_${feed.length}'),
                                          feedItemParam:
                                              FeedItemStruct.maybeFromMap(
                                                  feedItem)!,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              if (FFAppState().isQuizExpanded == false)
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.goodModel,
                    updateCallback: () => safeSetState(() {}),
                    child: GoodWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

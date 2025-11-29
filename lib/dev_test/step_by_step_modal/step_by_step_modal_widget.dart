import '/backend/schema/structs/index.dart';
import '/dev_test/step3_result_modal/step3_result_modal_widget.dart';
import '/dev_test/step3_study_modal/step3_study_modal_widget.dart';
import '/dev_test/step4_result_f_o_modal/step4_result_f_o_modal_widget.dart';
import '/dev_test/step4_result_k_o_modal/step4_result_k_o_modal_widget.dart';
import '/dev_test/step4_study_modal/step4_study_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'step_by_step_modal_model.dart';
export 'step_by_step_modal_model.dart';

class StepByStepModalWidget extends StatefulWidget {
  const StepByStepModalWidget({
    super.key,
    required this.feedItemParam,
  });

  final FeedItemStruct? feedItemParam;

  @override
  State<StepByStepModalWidget> createState() => _StepByStepModalWidgetState();
}

class _StepByStepModalWidgetState extends State<StepByStepModalWidget>
    with TickerProviderStateMixin {
  late StepByStepModalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepByStepModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // 단어 청크 램덤 배열 및 청크 만큼 길이 생성
      _model.sourceChunks = functions
          .shuffleList(
              (widget.feedItemParam?.learningActivities.elementAtOrNull(1))
                  ?.chunks
                  .toList())
          .toList()
          .cast<String>();
      _model.targetChunks = functions
          .createEmptySlots(widget.feedItemParam!.learningActivities
              .elementAtOrNull(1)!
              .chunks
              .toList())
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 2.0,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'textOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'textOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Container(
              width: double.infinity,
              height: 530.0,
              child: PageView(
                controller: _model.letsStudyController ??=
                    PageController(initialPage: 0),
                onPageChanged: (_) async {
                  // 3,4 피드백 초기화
                  FFAppState().step3FeedbackOn = false;
                  FFAppState().step4FeedbackOn = false;
                  safeSetState(() {});
                  FFAppState().isTipVisible = false;
                  safeSetState(() {});
                },
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xE6000000),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 65.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    (widget.feedItemParam?.learningActivities
                                            .elementAtOrNull(0))
                                        ?.question,
                                    '영상을 보고 \'飯はちゃんと食ってるか？\'의 알맞은 의미를 찾아봐요!',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          8.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final optionText = (widget.feedItemParam
                                                  ?.learningActivities
                                                  .elementAtOrNull(0))
                                              ?.options
                                              .toList() ??
                                          [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            List.generate(optionText.length,
                                                (optionTextIndex) {
                                          final optionTextItem =
                                              optionText[optionTextIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.isChecking ==
                                                    false) {
                                                  HapticFeedback.lightImpact();
                                                  // 잠금 걸기
                                                  _model.isChecking = true;
                                                  safeSetState(() {});
                                                  // 탭한 버튼 기억
                                                  _model.tappedIndex =
                                                      optionTextIndex;
                                                  safeSetState(() {});
                                                  // 답 확인 해보자 (주황)
                                                  _model.answerStatus = '\"\"';
                                                  safeSetState(() {});
                                                  if (optionTextIndex ==
                                                      (widget.feedItemParam
                                                              ?.learningActivities
                                                              .elementAtOrNull(
                                                                  0))
                                                          ?.answerIndex) {
                                                    // 정답
                                                    _model.answerStatus =
                                                        'correct';
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 1500,
                                                      ),
                                                    );
                                                    // 1초 뒤 다음 단계  ㄱㄱ
                                                    await _model
                                                        .letsStudyController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                    // 변수 초기화
                                                    _model.isChecking = false;
                                                    _model.tappedIndex = -1;
                                                    _model.answerStatus =
                                                        '\"\"';
                                                    safeSetState(() {});
                                                  } else {
                                                    // 오답
                                                    _model.answerStatus =
                                                        'wrong';
                                                    safeSetState(() {});
                                                    // 쉐이크
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 1000,
                                                      ),
                                                    );
                                                    // 변수 초기화
                                                    _model.isChecking = false;
                                                    _model.tappedIndex = -1;
                                                    _model.answerStatus =
                                                        '\"\"';
                                                    safeSetState(() {});
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0x1AFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(15.0),
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(15.0),
                                                  ),
                                                  border: Border.all(
                                                    color: () {
                                                      if ((_model.answerStatus ==
                                                              'correct') &&
                                                          (_model.tappedIndex ==
                                                              optionTextIndex)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .green;
                                                      } else if ((_model
                                                                  .answerStatus ==
                                                              'wrong') &&
                                                          (_model.tappedIndex ==
                                                              optionTextIndex)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .error;
                                                      } else if (_model
                                                              .tappedIndex ==
                                                          optionTextIndex) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    optionTextItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            )
                                                .animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation']!)
                                                .animateOnActionTrigger(
                                                  animationsMap[
                                                      'containerOnActionTriggerAnimation1']!,
                                                ),
                                          );
                                        }).divide(SizedBox(height: 20.0)),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().isTipVisible == true
                                        ? FlutterFlowTheme.of(context).warning
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          5.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().isTipVisible = true;
                                            FFAppState().update(() {});
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation1'] !=
                                                null) {
                                              await animationsMap[
                                                      'textOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            HapticFeedback.lightImpact();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/jsons/Light_Bulb.json',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                  frameRate: FrameRate(120.0),
                                                  animate: true,
                                                ).animateOnPageLoad(animationsMap[
                                                    'lottieAnimationOnPageLoadAnimation1']!),
                                              ),
                                              if (FFAppState().isTipVisible ==
                                                  false)
                                                Text(
                                                  '힌트가 필요하신가요?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              if (FFAppState().isTipVisible ==
                                                  true)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        (widget.feedItemParam
                                                                ?.learningActivities
                                                                .elementAtOrNull(
                                                                    0))
                                                            ?.tip,
                                                        '이 문장은 상대방의 신원을 묻는 표현입니다. 어투와 맥락을 고려해 보세요.',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xE6000000),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'textOnPageLoadAnimation1']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'textOnActionTriggerAnimation1']!,
                                                        ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          if (_model.answerStatus == 'correct')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Lottie.asset(
                                'assets/jsons/Confetti_-_Animation_01.json',
                                width: 350.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                                frameRate: FrameRate(120.0),
                                animate: true,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'STEP 1. 상황 이해하기',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 24.0,
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
                          Align(
                            alignment: AlignmentDirectional(0.9, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().isQuizExpanded = false;
                                  FFAppState().update(() {});
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x40FFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xE6000000),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 65.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    (widget.feedItemParam?.learningActivities
                                            .elementAtOrNull(1))
                                        ?.question,
                                    '음성을 듣고, 단어 블록을 드래그하여 문장을 완성하세요.',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '빈 칸 채우기',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0x1AFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: DragTarget<String>(
                                                    onAcceptWithDetails:
                                                        (details) async {
                                                      // 청크 붙이기
                                                      _model.addToTargetChunks(
                                                          details.data);
                                                      safeSetState(() {});
                                                      _model
                                                          .removeFromSourceChunks(
                                                              details.data);
                                                      safeSetState(() {});
                                                      if (_model.sourceChunks
                                                              .length ==
                                                          0) {
                                                        if (functions.combineChunks(
                                                                _model
                                                                    .targetChunks
                                                                    .toList()) ==
                                                            (widget.feedItemParam
                                                                    ?.learningActivities
                                                                    .elementAtOrNull(
                                                                        1))
                                                                ?.targetSentence) {
                                                          _model.step2Status =
                                                              'correct';
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  1500,
                                                            ),
                                                          );
                                                          // 다음 페이지
                                                          await _model
                                                              .letsStudyController
                                                              ?.nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                          // 칸 비우기
                                                          _model.targetChunks =
                                                              [];
                                                          _model.sourceChunks = functions
                                                              .shuffleList((widget
                                                                      .feedItemParam
                                                                      ?.learningActivities
                                                                      .elementAtOrNull(
                                                                          1))
                                                                  ?.chunks
                                                                  .toList())
                                                              .toList()
                                                              .cast<String>();
                                                          _model.step2Status =
                                                              '\"\"';
                                                          safeSetState(() {});
                                                        } else {
                                                          // 쉐이크
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          // 칸 비우기
                                                          _model.targetChunks =
                                                              [];
                                                          _model.sourceChunks = functions
                                                              .shuffleList((widget
                                                                      .feedItemParam
                                                                      ?.learningActivities
                                                                      .elementAtOrNull(
                                                                          1))
                                                                  ?.chunks
                                                                  .toList())
                                                              .toList()
                                                              .cast<String>();
                                                          safeSetState(() {});
                                                        }
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    builder: (context, _, __) {
                                                      return Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final targetItem =
                                                                _model
                                                                    .targetChunks
                                                                    .toList();

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  targetItem
                                                                      .length,
                                                                  (targetItemIndex) {
                                                                final targetItemItem =
                                                                    targetItem[
                                                                        targetItemIndex];
                                                                return Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child: Text(
                                                                    targetItemItem,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation2']!,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '단어 카드',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x1AFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final sourceItem =
                                                  _model.sourceChunks.toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                controller:
                                                    _model.rowController,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          sourceItem.length,
                                                          (sourceItemIndex) {
                                                    final sourceItemItem =
                                                        sourceItem[
                                                            sourceItemIndex];
                                                    return Draggable<String>(
                                                      data: sourceItemItem,
                                                      feedback: Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: Container(
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                            child: Text(
                                                              sourceItemItem,
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
                                                                        .info,
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
                                                          ),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      12.0,
                                                                      8.0),
                                                          child: Text(
                                                            sourceItemItem,
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
                                                                      .info,
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
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                      .divide(
                                                          SizedBox(width: 8.0))
                                                      .addToStart(
                                                          SizedBox(width: 8.0))
                                                      .addToEnd(
                                                          SizedBox(width: 8.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().isTipVisible == true
                                        ? FlutterFlowTheme.of(context).warning
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          5.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().isTipVisible = true;
                                            FFAppState().update(() {});
                                            HapticFeedback.lightImpact();
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation2'] !=
                                                null) {
                                              await animationsMap[
                                                      'textOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/jsons/Light_Bulb.json',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.contain,
                                                  frameRate: FrameRate(120.0),
                                                  animate: true,
                                                ).animateOnPageLoad(animationsMap[
                                                    'lottieAnimationOnPageLoadAnimation2']!),
                                              ),
                                              if (FFAppState().isTipVisible ==
                                                  false)
                                                Text(
                                                  '힌트가 필요하신가요?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              if (FFAppState().isTipVisible ==
                                                  true)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        (widget.feedItemParam
                                                                ?.learningActivities
                                                                .elementAtOrNull(
                                                                    1))
                                                            ?.tip,
                                                        '이 문장은 상대방의 신원을 묻는 표현입니다. 어투와 맥락을 고려해 보세요.',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Color(
                                                                0xE6000000),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'textOnPageLoadAnimation2']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'textOnActionTriggerAnimation2']!,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          if (_model.step2Status == 'correct')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Lottie.asset(
                                'assets/jsons/Confetti_-_Animation_01.json',
                                width: 315.5,
                                height: 200.0,
                                fit: BoxFit.cover,
                                frameRate: FrameRate(120.0),
                                animate: true,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'STEP 2. 문장 재배치',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 24.0,
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
                          Align(
                            alignment: AlignmentDirectional(0.9, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().isQuizExpanded = false;
                                  FFAppState().update(() {});
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x40FFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xE6000000),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (FFAppState().step3FeedbackOn == false) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        wrapWithModel(
                                          model: _model.step3StudyModalModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: Step3StudyModalWidget(
                                            feedItem: widget.feedItemParam!,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.step3ResultModalModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: Step3ResultModalWidget(
                                            feedItem: widget.feedItemParam!,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.9, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().isQuizExpanded = false;
                                  FFAppState().update(() {});
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x40FFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().step3FeedbackOn == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'STEP 3. 따라 말하기',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineMediumIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xE6000000),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          if (FFAppState().step4FeedbackOn == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'STEP 4. 이제 당신 차례',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineMediumIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          Builder(
                            builder: (context) {
                              if (FFAppState().step4FeedbackOn == false) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 70.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '말하기 전에, 예시 문장들을 먼저 들어보세요.\n(잘모르겠다면 한국어로 대답해 보세요!)',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                      wrapWithModel(
                                        model: _model.step4StudyModalModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: Step4StudyModalWidget(
                                          feedItem: widget.feedItemParam!,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if ((FFAppState().step4FeedbackOn ==
                                      true) &&
                                  (FFAppState().step4ResultType ==
                                      'feedback')) {
                                return SingleChildScrollView(
                                  controller: _model.columnController,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.step4ResultFOModalModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: Step4ResultFOModalWidget(
                                          feedItem: widget.feedItemParam!,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if ((FFAppState().step4FeedbackOn ==
                                      true) &&
                                  (FFAppState().step4ResultType ==
                                      'translation')) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.step4ResultKOModalModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: Step4ResultKOModalWidget(
                                        feedItem: widget.feedItemParam!,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Text(
                                  '빈 페이지',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                );
                              }
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.9, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().isQuizExpanded = false;
                                  FFAppState().update(() {});
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x40FFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

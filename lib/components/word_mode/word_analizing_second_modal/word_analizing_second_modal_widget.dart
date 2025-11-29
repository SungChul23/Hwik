import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'word_analizing_second_modal_model.dart';
export 'word_analizing_second_modal_model.dart';

/// 서버가 사진 분석중임 ㄱㄷ
class WordAnalizingSecondModalWidget extends StatefulWidget {
  const WordAnalizingSecondModalWidget({super.key});

  @override
  State<WordAnalizingSecondModalWidget> createState() =>
      _WordAnalizingSecondModalWidgetState();
}

class _WordAnalizingSecondModalWidgetState
    extends State<WordAnalizingSecondModalWidget>
    with TickerProviderStateMixin {
  late WordAnalizingSecondModalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WordAnalizingSecondModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // 헤더 + 바디 매핑
      _model.worddetail = await WordFinalResultCall.call(
        fileKey: FFAppState().fileKey,
        originalWord: FFAppState().originalWord,
        targetLanguage: FFAppState().preferredLanguage,
        uuid: FFAppState().uuid,
        scenarioId: FFAppState().scenarioId,
      );

      if ((_model.worddetail?.succeeded ?? true)) {
        // 서버 응답 값 -> 앱변수에 저장
        FFAppState().originalWord = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.originalWord''',
        ).toString();
        FFAppState().relatedWords = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.relatedWords_kr
''',
        );
        FFAppState().translations = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.translationDetails''',
        );
        FFAppState().audioUrls = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.audioUrls
''',
        );
        FFAppState().imageUrl = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.imageUrl''',
        ).toString();
        FFAppState().previousLearning = getJsonField(
          (_model.worddetail?.jsonBody ?? ''),
          r'''$.previousLearning''',
        );
        safeSetState(() {});
        if (FFAppState().previousLearning != null) {
          // 이단어 본적있음
          FFAppState().hasPreviousLearning = true;
          safeSetState(() {});
        } else {
          // 이단어 본적없음
          FFAppState().hasPreviousLearning = false;
          safeSetState(() {});
        }

        // 결과보기 버튼 활성화
        _model.isResultReady2 = true;
        safeSetState(() {});
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );

        context.goNamed(WordDetailsPageWidget.routeName);
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 30.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              FFIcons.kx,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 14.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          if (_model.isResultReady2 == false)
                            Lottie.asset(
                              'assets/jsons/VoiceAnalyze.json',
                              width: 236.2,
                              height: 200.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          if (_model.isResultReady2 == true)
                            Lottie.asset(
                              'assets/jsons/Success.json',
                              width: 249.58,
                              height: 200.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_model.isResultReady2 == false)
                          Flexible(
                            child: Text(
                              '인식된 단어를 해석 중이에요!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleLargeIsCustom,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                        if (_model.isResultReady2 == true)
                          Text(
                            '이제 단어를 배워볼까요?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: Text(
                              '비슷한 단어들과 발음을 \n준비하고 있어요 🔍🎧',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ].divide(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ],
    );
  }
}

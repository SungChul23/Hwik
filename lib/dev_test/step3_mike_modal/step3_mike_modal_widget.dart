import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'step3_mike_modal_model.dart';
export 'step3_mike_modal_model.dart';

class Step3MikeModalWidget extends StatefulWidget {
  const Step3MikeModalWidget({
    super.key,
    required this.feedItem,
  });

  final FeedItemStruct? feedItem;

  @override
  State<Step3MikeModalWidget> createState() => _Step3MikeModalWidgetState();
}

class _Step3MikeModalWidgetState extends State<Step3MikeModalWidget> {
  late Step3MikeModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step3MikeModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // step 구글 토큰 , jobid주세요
      await actions.step3sendRequestStreamMessage(
        context,
        widget.feedItem!.webSocketContext.videoId,
        'jp',
        widget.feedItem!.webSocketContext.themeId,
      );
      await requestPermission(microphonePermission);
      await startAudioRecording(
        context,
        audioRecorder: _model.audioRecorder ??= AudioRecorder(),
      );
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
      children: [
        Spacer(),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  offset: Offset(0.0, 0.0),
                )
              ],
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: Color(0x33FFFFFF),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '발화를 마치려면 버튼을 다시 누르세요.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/jsons/Audio&Voice-A-002_(1).json',
                        width: 200.0,
                        height: 60.0,
                        fit: BoxFit.contain,
                        frameRate: FrameRate(120.0),
                        animate: true,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.stop_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 40.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          HapticFeedback.lightImpact();
                          // step3 녹음시작
                          await stopAudioRecording(
                            audioRecorder: _model.audioRecorder,
                            audioName: 'recordedFileBytes',
                            onRecordingComplete: (audioFilePath, audioBytes) {
                              _model.step3OutPut = audioFilePath;
                              _model.recordedFileBytes = audioBytes;
                            },
                          );

                          // 녹음본 저장
                          _model.step3Record = _model.step3OutPut;
                          safeSetState(() {});
                          // base64로 변환
                          _model.validBase64Audio =
                              await actions.readAudioAndConvertToB64(
                            _model.step3Record,
                          );
                          await Future.wait([
                            Future(() async {
                              // s3 버킷 올림
                              await actions.uploadAudioToS3(
                                FFAppState().uploadUrl,
                                FFAppState().uuid,
                                _model.validBase64Audio!,
                              );
                            }),
                            Future(() async {
                              // 구글 STT 통신
                              _model.step3GoogleSttResult =
                                  await actions.step3getGoogleSttResult(
                                context,
                                _model.validBase64Audio!,
                                FFAppState().googleSttToken,
                              );
                              // 서버에게 메시지 요청
                              await actions.step3sendPronunciation(
                                FFAppState().jobId,
                                getJsonField(
                                  _model.step3GoogleSttResult,
                                  r'''$.transcript''',
                                ).toString(),
                              );
                            }),
                          ]);
                          await Future.delayed(
                            Duration(
                              milliseconds: 500,
                            ),
                          );
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

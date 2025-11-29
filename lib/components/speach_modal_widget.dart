import '/components/server_wait_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'speach_modal_model.dart';
export 'speach_modal_model.dart';

class SpeachModalWidget extends StatefulWidget {
  const SpeachModalWidget({super.key});

  @override
  State<SpeachModalWidget> createState() => _SpeachModalWidgetState();
}

class _SpeachModalWidgetState extends State<SpeachModalWidget> {
  late SpeachModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeachModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 0.0,
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              border: Border.all(
                color: Color(0x33FFFFFF),
                width: 2.0,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/jsons/isRecording.json',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  fillColor: FlutterFlowTheme.of(context).error,
                                  icon: Icon(
                                    Icons.mic_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 28.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    await stopAudioRecording(
                                      audioRecorder: _model.audioRecorder,
                                      audioName: 'recordedFileBytes',
                                      onRecordingComplete:
                                          (audioFilePath, audioBytes) {
                                        _model.saysomeOutPut = audioFilePath;
                                        _model.recordedFileBytes = audioBytes;
                                      },
                                    );

                                    _model.recordOutPut = _model.saysomeOutPut;
                                    safeSetState(() {});
                                    // base64로 변환
                                    _model.validBase64Audio =
                                        await actions.readAudioAndConvertToB64(
                                      _model.recordOutPut,
                                    );
                                    await Future.wait([
                                      Future(() async {
                                        await actions.uploadAudioToS3(
                                          FFAppState().uploadUrl,
                                          FFAppState().uuid,
                                          _model.validBase64Audio!,
                                        );
                                      }),
                                      Future(() async {
                                        _model.googleSTTResult =
                                            await actions.getGoogleSttResult(
                                          context,
                                          _model.validBase64Audio!,
                                          FFAppState().googleSttToken,
                                          'ja-JP',
                                          'ko-KR',
                                        );
                                      }),
                                    ]);
                                    Navigator.pop(context);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ServerWaitModalWidget(
                                            transcript: getJsonField(
                                              _model.googleSTTResult,
                                              r'''$.transcript''',
                                            ).toString(),
                                            languageCode: getJsonField(
                                              _model.googleSTTResult,
                                              r'''$.languageCode''',
                                            ).toString(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    safeSetState(() {});
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '발화를 마치려면 버튼을 다시 누르세요.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .mainWhite,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

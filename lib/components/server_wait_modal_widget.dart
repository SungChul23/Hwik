import '/components/shortform/shortform_result_modal_f_o/shortform_result_modal_f_o_widget.dart';
import '/components/shortform/shortform_result_modal_k_r/shortform_result_modal_k_r_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'server_wait_modal_model.dart';
export 'server_wait_modal_model.dart';

class ServerWaitModalWidget extends StatefulWidget {
  const ServerWaitModalWidget({
    super.key,
    required this.transcript,
    required this.languageCode,
  });

  final String? transcript;
  final String? languageCode;

  @override
  State<ServerWaitModalWidget> createState() => _ServerWaitModalWidgetState();
}

class _ServerWaitModalWidgetState extends State<ServerWaitModalWidget> {
  late ServerWaitModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServerWaitModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.sendProcessResult(
        FFAppState().jobId,
        widget.transcript!,
        widget.languageCode!,
      );
      if (widget.languageCode == 'ko-KR') {
        await Future.delayed(
          Duration(
            milliseconds: 2000,
          ),
        );
        Navigator.pop(context);
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ShortformResultModalKRWidget(),
            );
          },
        ).then((value) => safeSetState(() {}));
      } else {
        await Future.delayed(
          Duration(
            milliseconds: 5000,
          ),
        );
        Navigator.pop(context);
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ShortformResultModalFOWidget(),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
                              'assets/jsons/Paper_notebook_writing_animation.json',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(120.0),
                              animate: true,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Text(
                                    '마지막 한 줄까지 꼼꼼히 \n확인 중이에요',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '결과를 깔끔하게 정리하고 있어요 📄',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .mainWhite,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
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

import '/backend/schema/structs/index.dart';
import '/dev_test/step4_mike_modal/step4_mike_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'step4_study_modal_model.dart';
export 'step4_study_modal_model.dart';

class Step4StudyModalWidget extends StatefulWidget {
  const Step4StudyModalWidget({
    super.key,
    required this.feedItem,
  });

  final FeedItemStruct? feedItem;

  @override
  State<Step4StudyModalWidget> createState() => _Step4StudyModalWidgetState();
}

class _Step4StudyModalWidgetState extends State<Step4StudyModalWidget> {
  late Step4StudyModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step4StudyModalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
        child: SingleChildScrollView(
          primary: false,
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Color(0xFF333333),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(0))
                                    ?.recommendedAnswer,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(0))
                                    ?.pronunciation,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(0))
                                    ?.koreanTranslation,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 25.0,
                        borderWidth: 1.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.volume_up,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          HapticFeedback.lightImpact();
                          _model.soundPlayer1 ??= AudioPlayer();
                          if (_model.soundPlayer1!.playing) {
                            await _model.soundPlayer1!.stop();
                          }
                          _model.soundPlayer1!.setVolume(1.0);
                          _model.soundPlayer1!
                              .setUrl(getJsonField(
                                widget.feedItem!.learningActivities
                                    .elementAtOrNull(2)!
                                    .recommendedResponses
                                    .elementAtOrNull(0)!
                                    .toMap(),
                                r'''$.audio_url''',
                              ).toString())
                              .then((_) => _model.soundPlayer1!.play());
                        },
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Color(0xFF333333),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(1))
                                    ?.recommendedAnswer,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(1))
                                    ?.pronunciation,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                ((widget.feedItem?.learningActivities
                                            .elementAtOrNull(2))
                                        ?.recommendedResponses
                                        .elementAtOrNull(1))
                                    ?.koreanTranslation,
                                '\"\"',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 25.0,
                        borderWidth: 1.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.volume_up,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          HapticFeedback.lightImpact();
                          _model.soundPlayer2 ??= AudioPlayer();
                          if (_model.soundPlayer2!.playing) {
                            await _model.soundPlayer2!.stop();
                          }
                          _model.soundPlayer2!.setVolume(1.0);
                          _model.soundPlayer2!
                              .setUrl(getJsonField(
                                widget.feedItem!.learningActivities
                                    .elementAtOrNull(2)!
                                    .recommendedResponses
                                    .elementAtOrNull(1)!
                                    .toMap(),
                                r'''$.audio_url''',
                              ).toString())
                              .then((_) => _model.soundPlayer2!.play());
                        },
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 32.0,
                      color: Color(0x66FF6B35),
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  shape: BoxShape.circle,
                ),
                child: FlutterFlowIconButton(
                  buttonSize: 120.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    HapticFeedback.lightImpact();
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Step4MikeModalWidget(
                            feedItem: widget.feedItem!,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}

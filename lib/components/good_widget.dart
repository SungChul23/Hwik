import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'good_model.dart';
export 'good_model.dart';

class GoodWidget extends StatefulWidget {
  const GoodWidget({super.key});

  @override
  State<GoodWidget> createState() => _GoodWidgetState();
}

class _GoodWidgetState extends State<GoodWidget> {
  late GoodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoodModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 13.0),
              child: Container(
                width: double.infinity,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Color(0x66000000),
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(
                    color: Color(0x33FFFFFF),
                    width: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
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
                                        gradient: LinearGradient(
                                          colors: [
                                            FFAppState().navIndex == 0
                                                ? Color(0xFFFF6B35)
                                                : Color(0x00000000),
                                            FFAppState().navIndex == 0
                                                ? Color(0xFFFF8C42)
                                                : Color(0x00000000)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 24.0,
                                        borderWidth: 0.0,
                                        buttonSize: 64.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.search,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().navIndex = 0;
                                          safeSetState(() {});

                                          context.goNamed(
                                              SearchShortFormPageWidget
                                                  .routeName);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
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
                                        gradient: LinearGradient(
                                          colors: [
                                            FFAppState().navIndex == 1
                                                ? Color(0xFFFF6B35)
                                                : Color(0x00000000),
                                            FFAppState().navIndex == 1
                                                ? Color(0xFFFF8C42)
                                                : Color(0x00000000)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 24.0,
                                        borderWidth: 1.0,
                                        buttonSize: 64.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.play,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().navIndex = 1;
                                          safeSetState(() {});

                                          context.goNamed(
                                              MainShortFormViewPageWidget
                                                  .routeName);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
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
                                        gradient: LinearGradient(
                                          colors: [
                                            FFAppState().navIndex == 2
                                                ? Color(0xFFFF6B35)
                                                : Color(0x00000000),
                                            FFAppState().navIndex == 2
                                                ? Color(0xFFFF8C42)
                                                : Color(0x00000000)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -1.0),
                                          end: AlignmentDirectional(-1.0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 24.0,
                                        borderWidth: 0.0,
                                        buttonSize: 64.0,
                                        icon: Icon(
                                          Icons.person_sharp,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().navIndex = 2;
                                          safeSetState(() {});

                                          context.goNamed(
                                              MyprofilePageWidget.routeName);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

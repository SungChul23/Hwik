import '/backend/api_requests/api_calls.dart';
import '/components/word_mode/word_analizing_first_modal/word_analizing_first_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'camera_on_modal_model.dart';
export 'camera_on_modal_model.dart';

/// 언어 선택: 사용자의 preferredLanguage 값.
///
/// 촬영 시각: 사진을 찍은 시간.
///
/// 위치 정보: GPS를 통해 얻은 촬영 위치.
///
/// 기기 정보: 사용된 스마트폰 모델 등.
class CameraOnModalWidget extends StatefulWidget {
  const CameraOnModalWidget({super.key});

  @override
  State<CameraOnModalWidget> createState() => _CameraOnModalWidgetState();
}

class _CameraOnModalWidgetState extends State<CameraOnModalWidget> {
  late CameraOnModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraOnModalModel());

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
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 60.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primaryText,
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
                          HapticFeedback.lightImpact();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ].addToStart(SizedBox(height: 16.0)),
              ),
              Flexible(
                child: Text(
                  '오늘의 새로운 단어는 무엇인가요?',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleLargeFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleLargeIsCustom,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              HapticFeedback.lightImpact();
                              // 카메라 권한
                              await requestPermission(cameraPermission);
                              // 사진 촬영
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                imageQuality: 70,
                                allowPhoto: true,
                                textColor: FlutterFlowTheme.of(context).primary,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadDataMi8 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_uploadDataMi8 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataMi8 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              // 사진찍은거 변수에 담음
                              _model.photoFile =
                                  _model.uploadedLocalFile_uploadDataMi8;
                              safeSetState(() {});
                              // 헤더 매핑 + url 주세요
                              _model.apiResultkfv =
                                  await GetPresignedUrlCall.call(
                                uuid: FFAppState().uuid,
                              );

                              if ((_model.apiResultkfv?.succeeded ?? true)) {
                                FFAppState().scenarioId = getJsonField(
                                  (_model.apiResultkfv?.jsonBody ?? ''),
                                  r'''$.scenarioId''',
                                ).toString();
                                FFAppState().uploadurlWord = getJsonField(
                                  (_model.apiResultkfv?.jsonBody ?? ''),
                                  r'''$.upload_url''',
                                ).toString();
                                FFAppState().update(() {});
                                // url 받고 put 요청
                                await actions.uploadImageToS3(
                                  FFAppState().uploadurlWord,
                                  _model.photoFile!,
                                );
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: WordAnalizingFirstModalWidget(
                                        photoFile: _model.photoFile!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '실패',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            text: '촬영 시작',
                            options: FFButtonOptions(
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 16.0, 24.0, 16.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}

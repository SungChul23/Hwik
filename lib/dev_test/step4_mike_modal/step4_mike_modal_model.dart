import '/flutter_flow/flutter_flow_util.dart';
import 'step4_mike_modal_widget.dart' show Step4MikeModalWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Step4MikeModalModel extends FlutterFlowModel<Step4MikeModalWidget> {
  ///  Local state fields for this component.

  String? step4Record;

  ///  State fields for stateful widgets in this component.

  AudioRecorder? audioRecorder;
  String? step4OutPut;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // Stores action output result for [Custom Action - readAudioAndConvertToB64] action in IconButton widget.
  String? validBase64Audio;
  // Stores action output result for [Custom Action - getGoogleSttResult] action in IconButton widget.
  dynamic step4GoogleSttResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

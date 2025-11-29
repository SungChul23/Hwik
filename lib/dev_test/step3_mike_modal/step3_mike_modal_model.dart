import '/flutter_flow/flutter_flow_util.dart';
import 'step3_mike_modal_widget.dart' show Step3MikeModalWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Step3MikeModalModel extends FlutterFlowModel<Step3MikeModalWidget> {
  ///  Local state fields for this component.

  String? step3Record;

  ///  State fields for stateful widgets in this component.

  AudioRecorder? audioRecorder;
  String? step3OutPut;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // Stores action output result for [Custom Action - readAudioAndConvertToB64] action in IconButton widget.
  String? validBase64Audio;
  // Stores action output result for [Custom Action - step3getGoogleSttResult] action in IconButton widget.
  dynamic step3GoogleSttResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

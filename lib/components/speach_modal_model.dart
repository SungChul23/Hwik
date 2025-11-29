import '/flutter_flow/flutter_flow_util.dart';
import 'speach_modal_widget.dart' show SpeachModalWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class SpeachModalModel extends FlutterFlowModel<SpeachModalWidget> {
  ///  Local state fields for this component.
  /// 녹음 결과
  String? recordOutPut;

  /// Transcribe있냐
  bool isTranscribeReday = false;

  ///  State fields for stateful widgets in this component.

  AudioRecorder? audioRecorder;
  String? saysomeOutPut;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // Stores action output result for [Custom Action - readAudioAndConvertToB64] action in IconButton widget.
  String? validBase64Audio;
  // Stores action output result for [Custom Action - getGoogleSttResult] action in IconButton widget.
  dynamic googleSTTResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

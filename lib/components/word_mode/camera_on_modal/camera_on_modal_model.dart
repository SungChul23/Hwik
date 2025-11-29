import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'camera_on_modal_widget.dart' show CameraOnModalWidget;
import 'package:flutter/material.dart';

class CameraOnModalModel extends FlutterFlowModel<CameraOnModalWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? photoFile;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataMi8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataMi8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (GetPresignedUrl)] action in Button widget.
  ApiCallResponse? apiResultkfv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

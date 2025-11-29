import '/flutter_flow/flutter_flow_util.dart';
import 'edit_word_modal_widget.dart' show EditWordModalWidget;
import 'package:flutter/material.dart';

class EditWordModalModel extends FlutterFlowModel<EditWordModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();
  }
}

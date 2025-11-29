import '/dev_test/step3_result_modal/step3_result_modal_widget.dart';
import '/dev_test/step3_study_modal/step3_study_modal_widget.dart';
import '/dev_test/step4_result_f_o_modal/step4_result_f_o_modal_widget.dart';
import '/dev_test/step4_result_k_o_modal/step4_result_k_o_modal_widget.dart';
import '/dev_test/step4_study_modal/step4_study_modal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'step_by_step_modal_widget.dart' show StepByStepModalWidget;
import 'package:flutter/material.dart';

class StepByStepModalModel extends FlutterFlowModel<StepByStepModalWidget> {
  ///  Local state fields for this component.
  /// 단어 조각들
  List<String> sourceChunks = [];
  void addToSourceChunks(String item) => sourceChunks.add(item);
  void removeFromSourceChunks(String item) => sourceChunks.remove(item);
  void removeAtIndexFromSourceChunks(int index) => sourceChunks.removeAt(index);
  void insertAtIndexInSourceChunks(int index, String item) =>
      sourceChunks.insert(index, item);
  void updateSourceChunksAtIndex(int index, Function(String) updateFn) =>
      sourceChunks[index] = updateFn(sourceChunks[index]);

  /// 정답 칸
  List<String> targetChunks = [];
  void addToTargetChunks(String item) => targetChunks.add(item);
  void removeFromTargetChunks(String item) => targetChunks.remove(item);
  void removeAtIndexFromTargetChunks(int index) => targetChunks.removeAt(index);
  void insertAtIndexInTargetChunks(int index, String item) =>
      targetChunks.insert(index, item);
  void updateTargetChunksAtIndex(int index, Function(String) updateFn) =>
      targetChunks[index] = updateFn(targetChunks[index]);

  /// step1 뭘 눌렀는지
  int? tappedIndex = -1;

  bool isChecking = false;

  String answerStatus = '\"\"';

  String step2Status = '\"\"';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Lets_Study widget.
  PageController? letsStudyController;

  int get letsStudyCurrentIndex => letsStudyController != null &&
          letsStudyController!.hasClients &&
          letsStudyController!.page != null
      ? letsStudyController!.page!.round()
      : 0;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // Model for step3_Study_modal component.
  late Step3StudyModalModel step3StudyModalModel;
  // Model for step3_Result_modal component.
  late Step3ResultModalModel step3ResultModalModel;
  // Model for step4_Study_modal component.
  late Step4StudyModalModel step4StudyModalModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for step4_Result_FO_modal component.
  late Step4ResultFOModalModel step4ResultFOModalModel;
  // Model for step4_Result_KO_modal component.
  late Step4ResultKOModalModel step4ResultKOModalModel;

  @override
  void initState(BuildContext context) {
    rowController = ScrollController();
    step3StudyModalModel = createModel(context, () => Step3StudyModalModel());
    step3ResultModalModel = createModel(context, () => Step3ResultModalModel());
    step4StudyModalModel = createModel(context, () => Step4StudyModalModel());
    columnController = ScrollController();
    step4ResultFOModalModel =
        createModel(context, () => Step4ResultFOModalModel());
    step4ResultKOModalModel =
        createModel(context, () => Step4ResultKOModalModel());
  }

  @override
  void dispose() {
    rowController?.dispose();
    step3StudyModalModel.dispose();
    step3ResultModalModel.dispose();
    step4StudyModalModel.dispose();
    columnController?.dispose();
    step4ResultFOModalModel.dispose();
    step4ResultKOModalModel.dispose();
  }
}

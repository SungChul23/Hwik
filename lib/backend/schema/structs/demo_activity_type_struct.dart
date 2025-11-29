// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// 학습 1,2단계
class DemoActivityTypeStruct extends BaseStruct {
  DemoActivityTypeStruct({
    int? activityId,
    List<String>? options,
    String? tip,
    String? question,
    String? activityType,
    int? answerIndex,
    String? questionSentenceLang,
    String? questionSentenceKo,
  })  : _activityId = activityId,
        _options = options,
        _tip = tip,
        _question = question,
        _activityType = activityType,
        _answerIndex = answerIndex,
        _questionSentenceLang = questionSentenceLang,
        _questionSentenceKo = questionSentenceKo;

  // "activity_id" field.
  int? _activityId;
  int get activityId => _activityId ?? 0;
  set activityId(int? val) => _activityId = val;

  void incrementActivityId(int amount) => activityId = activityId + amount;

  bool hasActivityId() => _activityId != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "tip" field.
  String? _tip;
  String get tip => _tip ?? '';
  set tip(String? val) => _tip = val;

  bool hasTip() => _tip != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "activity_type" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  set activityType(String? val) => _activityType = val;

  bool hasActivityType() => _activityType != null;

  // "answer_index" field.
  int? _answerIndex;
  int get answerIndex => _answerIndex ?? 0;
  set answerIndex(int? val) => _answerIndex = val;

  void incrementAnswerIndex(int amount) => answerIndex = answerIndex + amount;

  bool hasAnswerIndex() => _answerIndex != null;

  // "question_sentence_lang" field.
  String? _questionSentenceLang;
  String get questionSentenceLang => _questionSentenceLang ?? '';
  set questionSentenceLang(String? val) => _questionSentenceLang = val;

  bool hasQuestionSentenceLang() => _questionSentenceLang != null;

  // "question_sentence_ko" field.
  String? _questionSentenceKo;
  String get questionSentenceKo => _questionSentenceKo ?? '';
  set questionSentenceKo(String? val) => _questionSentenceKo = val;

  bool hasQuestionSentenceKo() => _questionSentenceKo != null;

  static DemoActivityTypeStruct fromMap(Map<String, dynamic> data) =>
      DemoActivityTypeStruct(
        activityId: castToType<int>(data['activity_id']),
        options: getDataList(data['options']),
        tip: data['tip'] as String?,
        question: data['question'] as String?,
        activityType: data['activity_type'] as String?,
        answerIndex: castToType<int>(data['answer_index']),
        questionSentenceLang: data['question_sentence_lang'] as String?,
        questionSentenceKo: data['question_sentence_ko'] as String?,
      );

  static DemoActivityTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DemoActivityTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'activity_id': _activityId,
        'options': _options,
        'tip': _tip,
        'question': _question,
        'activity_type': _activityType,
        'answer_index': _answerIndex,
        'question_sentence_lang': _questionSentenceLang,
        'question_sentence_ko': _questionSentenceKo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'activity_id': serializeParam(
          _activityId,
          ParamType.int,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'tip': serializeParam(
          _tip,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'activity_type': serializeParam(
          _activityType,
          ParamType.String,
        ),
        'answer_index': serializeParam(
          _answerIndex,
          ParamType.int,
        ),
        'question_sentence_lang': serializeParam(
          _questionSentenceLang,
          ParamType.String,
        ),
        'question_sentence_ko': serializeParam(
          _questionSentenceKo,
          ParamType.String,
        ),
      }.withoutNulls;

  static DemoActivityTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DemoActivityTypeStruct(
        activityId: deserializeParam(
          data['activity_id'],
          ParamType.int,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        tip: deserializeParam(
          data['tip'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        activityType: deserializeParam(
          data['activity_type'],
          ParamType.String,
          false,
        ),
        answerIndex: deserializeParam(
          data['answer_index'],
          ParamType.int,
          false,
        ),
        questionSentenceLang: deserializeParam(
          data['question_sentence_lang'],
          ParamType.String,
          false,
        ),
        questionSentenceKo: deserializeParam(
          data['question_sentence_ko'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DemoActivityTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DemoActivityTypeStruct &&
        activityId == other.activityId &&
        listEquality.equals(options, other.options) &&
        tip == other.tip &&
        question == other.question &&
        activityType == other.activityType &&
        answerIndex == other.answerIndex &&
        questionSentenceLang == other.questionSentenceLang &&
        questionSentenceKo == other.questionSentenceKo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        activityId,
        options,
        tip,
        question,
        activityType,
        answerIndex,
        questionSentenceLang,
        questionSentenceKo
      ]);
}

DemoActivityTypeStruct createDemoActivityTypeStruct({
  int? activityId,
  String? tip,
  String? question,
  String? activityType,
  int? answerIndex,
  String? questionSentenceLang,
  String? questionSentenceKo,
}) =>
    DemoActivityTypeStruct(
      activityId: activityId,
      tip: tip,
      question: question,
      activityType: activityType,
      answerIndex: answerIndex,
      questionSentenceLang: questionSentenceLang,
      questionSentenceKo: questionSentenceKo,
    );

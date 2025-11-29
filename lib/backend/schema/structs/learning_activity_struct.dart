// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// 학습 단계 데이터 정의
class LearningActivityStruct extends BaseStruct {
  LearningActivityStruct({
    /// 어떤 종류의 문제인지
    String? activityType,

    /// step 번호
    int? activityId,

    /// 문제 정의
    String? question,

    /// 힌트
    String? tip,

    /// Step1 4지선다
    List<String>? options,

    /// 스텝1  :[답]
    int? answerIndex,

    /// 스텝 2 에서 조합해야할 문장
    String? targetSentence,

    /// 스텝2 단어 조각
    List<String>? chunks,

    /// step 오디오
    String? sourceAudioUrl,
    List<RecommendedResponseStruct>? recommendedResponses,

    /// 스텝3 를 위한 오디오 url
    String? audioUrl,

    /// step3 한국어발으
    String? pronunciation,
  })  : _activityType = activityType,
        _activityId = activityId,
        _question = question,
        _tip = tip,
        _options = options,
        _answerIndex = answerIndex,
        _targetSentence = targetSentence,
        _chunks = chunks,
        _sourceAudioUrl = sourceAudioUrl,
        _recommendedResponses = recommendedResponses,
        _audioUrl = audioUrl,
        _pronunciation = pronunciation;

  // "activity_type" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  set activityType(String? val) => _activityType = val;

  bool hasActivityType() => _activityType != null;

  // "activity_id" field.
  int? _activityId;
  int get activityId => _activityId ?? 0;
  set activityId(int? val) => _activityId = val;

  void incrementActivityId(int amount) => activityId = activityId + amount;

  bool hasActivityId() => _activityId != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "tip" field.
  String? _tip;
  String get tip => _tip ?? '';
  set tip(String? val) => _tip = val;

  bool hasTip() => _tip != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "answer_index" field.
  int? _answerIndex;
  int get answerIndex => _answerIndex ?? 0;
  set answerIndex(int? val) => _answerIndex = val;

  void incrementAnswerIndex(int amount) => answerIndex = answerIndex + amount;

  bool hasAnswerIndex() => _answerIndex != null;

  // "target_sentence" field.
  String? _targetSentence;
  String get targetSentence => _targetSentence ?? '';
  set targetSentence(String? val) => _targetSentence = val;

  bool hasTargetSentence() => _targetSentence != null;

  // "chunks" field.
  List<String>? _chunks;
  List<String> get chunks => _chunks ?? const [];
  set chunks(List<String>? val) => _chunks = val;

  void updateChunks(Function(List<String>) updateFn) {
    updateFn(_chunks ??= []);
  }

  bool hasChunks() => _chunks != null;

  // "source_audio_url" field.
  String? _sourceAudioUrl;
  String get sourceAudioUrl => _sourceAudioUrl ?? '';
  set sourceAudioUrl(String? val) => _sourceAudioUrl = val;

  bool hasSourceAudioUrl() => _sourceAudioUrl != null;

  // "recommended_responses" field.
  List<RecommendedResponseStruct>? _recommendedResponses;
  List<RecommendedResponseStruct> get recommendedResponses =>
      _recommendedResponses ?? const [];
  set recommendedResponses(List<RecommendedResponseStruct>? val) =>
      _recommendedResponses = val;

  void updateRecommendedResponses(
      Function(List<RecommendedResponseStruct>) updateFn) {
    updateFn(_recommendedResponses ??= []);
  }

  bool hasRecommendedResponses() => _recommendedResponses != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "pronunciation" field.
  String? _pronunciation;
  String get pronunciation => _pronunciation ?? '';
  set pronunciation(String? val) => _pronunciation = val;

  bool hasPronunciation() => _pronunciation != null;

  static LearningActivityStruct fromMap(Map<String, dynamic> data) =>
      LearningActivityStruct(
        activityType: data['activity_type'] as String?,
        activityId: castToType<int>(data['activity_id']),
        question: data['question'] as String?,
        tip: data['tip'] as String?,
        options: getDataList(data['options']),
        answerIndex: castToType<int>(data['answer_index']),
        targetSentence: data['target_sentence'] as String?,
        chunks: getDataList(data['chunks']),
        sourceAudioUrl: data['source_audio_url'] as String?,
        recommendedResponses: getStructList(
          data['recommended_responses'],
          RecommendedResponseStruct.fromMap,
        ),
        audioUrl: data['audio_url'] as String?,
        pronunciation: data['pronunciation'] as String?,
      );

  static LearningActivityStruct? maybeFromMap(dynamic data) => data is Map
      ? LearningActivityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'activity_type': _activityType,
        'activity_id': _activityId,
        'question': _question,
        'tip': _tip,
        'options': _options,
        'answer_index': _answerIndex,
        'target_sentence': _targetSentence,
        'chunks': _chunks,
        'source_audio_url': _sourceAudioUrl,
        'recommended_responses':
            _recommendedResponses?.map((e) => e.toMap()).toList(),
        'audio_url': _audioUrl,
        'pronunciation': _pronunciation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'activity_type': serializeParam(
          _activityType,
          ParamType.String,
        ),
        'activity_id': serializeParam(
          _activityId,
          ParamType.int,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'tip': serializeParam(
          _tip,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'answer_index': serializeParam(
          _answerIndex,
          ParamType.int,
        ),
        'target_sentence': serializeParam(
          _targetSentence,
          ParamType.String,
        ),
        'chunks': serializeParam(
          _chunks,
          ParamType.String,
          isList: true,
        ),
        'source_audio_url': serializeParam(
          _sourceAudioUrl,
          ParamType.String,
        ),
        'recommended_responses': serializeParam(
          _recommendedResponses,
          ParamType.DataStruct,
          isList: true,
        ),
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'pronunciation': serializeParam(
          _pronunciation,
          ParamType.String,
        ),
      }.withoutNulls;

  static LearningActivityStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LearningActivityStruct(
        activityType: deserializeParam(
          data['activity_type'],
          ParamType.String,
          false,
        ),
        activityId: deserializeParam(
          data['activity_id'],
          ParamType.int,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        tip: deserializeParam(
          data['tip'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        answerIndex: deserializeParam(
          data['answer_index'],
          ParamType.int,
          false,
        ),
        targetSentence: deserializeParam(
          data['target_sentence'],
          ParamType.String,
          false,
        ),
        chunks: deserializeParam<String>(
          data['chunks'],
          ParamType.String,
          true,
        ),
        sourceAudioUrl: deserializeParam(
          data['source_audio_url'],
          ParamType.String,
          false,
        ),
        recommendedResponses: deserializeStructParam<RecommendedResponseStruct>(
          data['recommended_responses'],
          ParamType.DataStruct,
          true,
          structBuilder: RecommendedResponseStruct.fromSerializableMap,
        ),
        audioUrl: deserializeParam(
          data['audio_url'],
          ParamType.String,
          false,
        ),
        pronunciation: deserializeParam(
          data['pronunciation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LearningActivityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LearningActivityStruct &&
        activityType == other.activityType &&
        activityId == other.activityId &&
        question == other.question &&
        tip == other.tip &&
        listEquality.equals(options, other.options) &&
        answerIndex == other.answerIndex &&
        targetSentence == other.targetSentence &&
        listEquality.equals(chunks, other.chunks) &&
        sourceAudioUrl == other.sourceAudioUrl &&
        listEquality.equals(recommendedResponses, other.recommendedResponses) &&
        audioUrl == other.audioUrl &&
        pronunciation == other.pronunciation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        activityType,
        activityId,
        question,
        tip,
        options,
        answerIndex,
        targetSentence,
        chunks,
        sourceAudioUrl,
        recommendedResponses,
        audioUrl,
        pronunciation
      ]);
}

LearningActivityStruct createLearningActivityStruct({
  String? activityType,
  int? activityId,
  String? question,
  String? tip,
  int? answerIndex,
  String? targetSentence,
  String? sourceAudioUrl,
  String? audioUrl,
  String? pronunciation,
}) =>
    LearningActivityStruct(
      activityType: activityType,
      activityId: activityId,
      question: question,
      tip: tip,
      answerIndex: answerIndex,
      targetSentence: targetSentence,
      sourceAudioUrl: sourceAudioUrl,
      audioUrl: audioUrl,
      pronunciation: pronunciation,
    );

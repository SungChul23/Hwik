// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// feed API 종합
class DemoFeedItemTypeStruct extends BaseStruct {
  DemoFeedItemTypeStruct({
    String? videoId,
    String? videoUrl,
    String? title,
    String? characterInfo,

    /// 3단계에서 써먹자
    String? questionKoreanText,

    /// 3단계 발음 연습에 필요
    String? questionForeignText,
    bool? hasLearned,
    List<DemoActivityTypeStruct>? learningActivities,
    WebSocketContextTypeStruct? webSocketContext,
  })  : _videoId = videoId,
        _videoUrl = videoUrl,
        _title = title,
        _characterInfo = characterInfo,
        _questionKoreanText = questionKoreanText,
        _questionForeignText = questionForeignText,
        _hasLearned = hasLearned,
        _learningActivities = learningActivities,
        _webSocketContext = webSocketContext;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "characterInfo" field.
  String? _characterInfo;
  String get characterInfo => _characterInfo ?? '';
  set characterInfo(String? val) => _characterInfo = val;

  bool hasCharacterInfo() => _characterInfo != null;

  // "questionKoreanText" field.
  String? _questionKoreanText;
  String get questionKoreanText => _questionKoreanText ?? '';
  set questionKoreanText(String? val) => _questionKoreanText = val;

  bool hasQuestionKoreanText() => _questionKoreanText != null;

  // "questionForeignText" field.
  String? _questionForeignText;
  String get questionForeignText => _questionForeignText ?? '';
  set questionForeignText(String? val) => _questionForeignText = val;

  bool hasQuestionForeignText() => _questionForeignText != null;

  // "hasLearned" field.
  bool? _hasLearned;
  bool get hasLearned => _hasLearned ?? false;
  set hasLearned(bool? val) => _hasLearned = val;

  bool hasHasLearned() => _hasLearned != null;

  // "learning_activities" field.
  List<DemoActivityTypeStruct>? _learningActivities;
  List<DemoActivityTypeStruct> get learningActivities =>
      _learningActivities ?? const [];
  set learningActivities(List<DemoActivityTypeStruct>? val) =>
      _learningActivities = val;

  void updateLearningActivities(
      Function(List<DemoActivityTypeStruct>) updateFn) {
    updateFn(_learningActivities ??= []);
  }

  bool hasLearningActivities() => _learningActivities != null;

  // "webSocketContext" field.
  WebSocketContextTypeStruct? _webSocketContext;
  WebSocketContextTypeStruct get webSocketContext =>
      _webSocketContext ?? WebSocketContextTypeStruct();
  set webSocketContext(WebSocketContextTypeStruct? val) =>
      _webSocketContext = val;

  void updateWebSocketContext(Function(WebSocketContextTypeStruct) updateFn) {
    updateFn(_webSocketContext ??= WebSocketContextTypeStruct());
  }

  bool hasWebSocketContext() => _webSocketContext != null;

  static DemoFeedItemTypeStruct fromMap(Map<String, dynamic> data) =>
      DemoFeedItemTypeStruct(
        videoId: data['videoId'] as String?,
        videoUrl: data['videoUrl'] as String?,
        title: data['title'] as String?,
        characterInfo: data['characterInfo'] as String?,
        questionKoreanText: data['questionKoreanText'] as String?,
        questionForeignText: data['questionForeignText'] as String?,
        hasLearned: data['hasLearned'] as bool?,
        learningActivities: getStructList(
          data['learning_activities'],
          DemoActivityTypeStruct.fromMap,
        ),
        webSocketContext: data['webSocketContext'] is WebSocketContextTypeStruct
            ? data['webSocketContext']
            : WebSocketContextTypeStruct.maybeFromMap(data['webSocketContext']),
      );

  static DemoFeedItemTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DemoFeedItemTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'videoId': _videoId,
        'videoUrl': _videoUrl,
        'title': _title,
        'characterInfo': _characterInfo,
        'questionKoreanText': _questionKoreanText,
        'questionForeignText': _questionForeignText,
        'hasLearned': _hasLearned,
        'learning_activities':
            _learningActivities?.map((e) => e.toMap()).toList(),
        'webSocketContext': _webSocketContext?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'videoId': serializeParam(
          _videoId,
          ParamType.String,
        ),
        'videoUrl': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'characterInfo': serializeParam(
          _characterInfo,
          ParamType.String,
        ),
        'questionKoreanText': serializeParam(
          _questionKoreanText,
          ParamType.String,
        ),
        'questionForeignText': serializeParam(
          _questionForeignText,
          ParamType.String,
        ),
        'hasLearned': serializeParam(
          _hasLearned,
          ParamType.bool,
        ),
        'learning_activities': serializeParam(
          _learningActivities,
          ParamType.DataStruct,
          isList: true,
        ),
        'webSocketContext': serializeParam(
          _webSocketContext,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DemoFeedItemTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DemoFeedItemTypeStruct(
        videoId: deserializeParam(
          data['videoId'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['videoUrl'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        characterInfo: deserializeParam(
          data['characterInfo'],
          ParamType.String,
          false,
        ),
        questionKoreanText: deserializeParam(
          data['questionKoreanText'],
          ParamType.String,
          false,
        ),
        questionForeignText: deserializeParam(
          data['questionForeignText'],
          ParamType.String,
          false,
        ),
        hasLearned: deserializeParam(
          data['hasLearned'],
          ParamType.bool,
          false,
        ),
        learningActivities: deserializeStructParam<DemoActivityTypeStruct>(
          data['learning_activities'],
          ParamType.DataStruct,
          true,
          structBuilder: DemoActivityTypeStruct.fromSerializableMap,
        ),
        webSocketContext: deserializeStructParam(
          data['webSocketContext'],
          ParamType.DataStruct,
          false,
          structBuilder: WebSocketContextTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DemoFeedItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DemoFeedItemTypeStruct &&
        videoId == other.videoId &&
        videoUrl == other.videoUrl &&
        title == other.title &&
        characterInfo == other.characterInfo &&
        questionKoreanText == other.questionKoreanText &&
        questionForeignText == other.questionForeignText &&
        hasLearned == other.hasLearned &&
        listEquality.equals(learningActivities, other.learningActivities) &&
        webSocketContext == other.webSocketContext;
  }

  @override
  int get hashCode => const ListEquality().hash([
        videoId,
        videoUrl,
        title,
        characterInfo,
        questionKoreanText,
        questionForeignText,
        hasLearned,
        learningActivities,
        webSocketContext
      ]);
}

DemoFeedItemTypeStruct createDemoFeedItemTypeStruct({
  String? videoId,
  String? videoUrl,
  String? title,
  String? characterInfo,
  String? questionKoreanText,
  String? questionForeignText,
  bool? hasLearned,
  WebSocketContextTypeStruct? webSocketContext,
}) =>
    DemoFeedItemTypeStruct(
      videoId: videoId,
      videoUrl: videoUrl,
      title: title,
      characterInfo: characterInfo,
      questionKoreanText: questionKoreanText,
      questionForeignText: questionForeignText,
      hasLearned: hasLearned,
      webSocketContext: webSocketContext ?? WebSocketContextTypeStruct(),
    );

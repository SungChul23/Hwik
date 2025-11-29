// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebSocketContextTypeStruct extends BaseStruct {
  WebSocketContextTypeStruct({
    String? langCode,
    String? targetForeignLangCode,
    String? modelAnswerScript,
    String? videoId,
    String? langFullName,
    String? themeId,
  })  : _langCode = langCode,
        _targetForeignLangCode = targetForeignLangCode,
        _modelAnswerScript = modelAnswerScript,
        _videoId = videoId,
        _langFullName = langFullName,
        _themeId = themeId;

  // "langCode" field.
  String? _langCode;
  String get langCode => _langCode ?? '';
  set langCode(String? val) => _langCode = val;

  bool hasLangCode() => _langCode != null;

  // "targetForeignLangCode" field.
  String? _targetForeignLangCode;
  String get targetForeignLangCode => _targetForeignLangCode ?? '';
  set targetForeignLangCode(String? val) => _targetForeignLangCode = val;

  bool hasTargetForeignLangCode() => _targetForeignLangCode != null;

  // "modelAnswerScript" field.
  String? _modelAnswerScript;
  String get modelAnswerScript => _modelAnswerScript ?? '';
  set modelAnswerScript(String? val) => _modelAnswerScript = val;

  bool hasModelAnswerScript() => _modelAnswerScript != null;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  // "langFullName" field.
  String? _langFullName;
  String get langFullName => _langFullName ?? '';
  set langFullName(String? val) => _langFullName = val;

  bool hasLangFullName() => _langFullName != null;

  // "themeId" field.
  String? _themeId;
  String get themeId => _themeId ?? '';
  set themeId(String? val) => _themeId = val;

  bool hasThemeId() => _themeId != null;

  static WebSocketContextTypeStruct fromMap(Map<String, dynamic> data) =>
      WebSocketContextTypeStruct(
        langCode: data['langCode'] as String?,
        targetForeignLangCode: data['targetForeignLangCode'] as String?,
        modelAnswerScript: data['modelAnswerScript'] as String?,
        videoId: data['videoId'] as String?,
        langFullName: data['langFullName'] as String?,
        themeId: data['themeId'] as String?,
      );

  static WebSocketContextTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? WebSocketContextTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'langCode': _langCode,
        'targetForeignLangCode': _targetForeignLangCode,
        'modelAnswerScript': _modelAnswerScript,
        'videoId': _videoId,
        'langFullName': _langFullName,
        'themeId': _themeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'langCode': serializeParam(
          _langCode,
          ParamType.String,
        ),
        'targetForeignLangCode': serializeParam(
          _targetForeignLangCode,
          ParamType.String,
        ),
        'modelAnswerScript': serializeParam(
          _modelAnswerScript,
          ParamType.String,
        ),
        'videoId': serializeParam(
          _videoId,
          ParamType.String,
        ),
        'langFullName': serializeParam(
          _langFullName,
          ParamType.String,
        ),
        'themeId': serializeParam(
          _themeId,
          ParamType.String,
        ),
      }.withoutNulls;

  static WebSocketContextTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WebSocketContextTypeStruct(
        langCode: deserializeParam(
          data['langCode'],
          ParamType.String,
          false,
        ),
        targetForeignLangCode: deserializeParam(
          data['targetForeignLangCode'],
          ParamType.String,
          false,
        ),
        modelAnswerScript: deserializeParam(
          data['modelAnswerScript'],
          ParamType.String,
          false,
        ),
        videoId: deserializeParam(
          data['videoId'],
          ParamType.String,
          false,
        ),
        langFullName: deserializeParam(
          data['langFullName'],
          ParamType.String,
          false,
        ),
        themeId: deserializeParam(
          data['themeId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WebSocketContextTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WebSocketContextTypeStruct &&
        langCode == other.langCode &&
        targetForeignLangCode == other.targetForeignLangCode &&
        modelAnswerScript == other.modelAnswerScript &&
        videoId == other.videoId &&
        langFullName == other.langFullName &&
        themeId == other.themeId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        langCode,
        targetForeignLangCode,
        modelAnswerScript,
        videoId,
        langFullName,
        themeId
      ]);
}

WebSocketContextTypeStruct createWebSocketContextTypeStruct({
  String? langCode,
  String? targetForeignLangCode,
  String? modelAnswerScript,
  String? videoId,
  String? langFullName,
  String? themeId,
}) =>
    WebSocketContextTypeStruct(
      langCode: langCode,
      targetForeignLangCode: targetForeignLangCode,
      modelAnswerScript: modelAnswerScript,
      videoId: videoId,
      langFullName: langFullName,
      themeId: themeId,
    );

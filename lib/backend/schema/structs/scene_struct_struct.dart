// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SceneStructStruct extends BaseStruct {
  SceneStructStruct({
    String? langScript,
    String? koScript,
    String? speaker,
  })  : _langScript = langScript,
        _koScript = koScript,
        _speaker = speaker;

  // "lang-script" field.
  String? _langScript;
  String get langScript => _langScript ?? '';
  set langScript(String? val) => _langScript = val;

  bool hasLangScript() => _langScript != null;

  // "ko-script" field.
  String? _koScript;
  String get koScript => _koScript ?? '';
  set koScript(String? val) => _koScript = val;

  bool hasKoScript() => _koScript != null;

  // "speaker" field.
  String? _speaker;
  String get speaker => _speaker ?? '';
  set speaker(String? val) => _speaker = val;

  bool hasSpeaker() => _speaker != null;

  static SceneStructStruct fromMap(Map<String, dynamic> data) =>
      SceneStructStruct(
        langScript: data['lang-script'] as String?,
        koScript: data['ko-script'] as String?,
        speaker: data['speaker'] as String?,
      );

  static SceneStructStruct? maybeFromMap(dynamic data) => data is Map
      ? SceneStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lang-script': _langScript,
        'ko-script': _koScript,
        'speaker': _speaker,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lang-script': serializeParam(
          _langScript,
          ParamType.String,
        ),
        'ko-script': serializeParam(
          _koScript,
          ParamType.String,
        ),
        'speaker': serializeParam(
          _speaker,
          ParamType.String,
        ),
      }.withoutNulls;

  static SceneStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      SceneStructStruct(
        langScript: deserializeParam(
          data['lang-script'],
          ParamType.String,
          false,
        ),
        koScript: deserializeParam(
          data['ko-script'],
          ParamType.String,
          false,
        ),
        speaker: deserializeParam(
          data['speaker'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SceneStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SceneStructStruct &&
        langScript == other.langScript &&
        koScript == other.koScript &&
        speaker == other.speaker;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([langScript, koScript, speaker]);
}

SceneStructStruct createSceneStructStruct({
  String? langScript,
  String? koScript,
  String? speaker,
}) =>
    SceneStructStruct(
      langScript: langScript,
      koScript: koScript,
      speaker: speaker,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DemoRecommendStructStruct extends BaseStruct {
  DemoRecommendStructStruct({
    String? s3Url,
    String? script,
    String? koScript,
  })  : _s3Url = s3Url,
        _script = script,
        _koScript = koScript;

  // "s3Url" field.
  String? _s3Url;
  String get s3Url => _s3Url ?? '';
  set s3Url(String? val) => _s3Url = val;

  bool hasS3Url() => _s3Url != null;

  // "script" field.
  String? _script;
  String get script => _script ?? '';
  set script(String? val) => _script = val;

  bool hasScript() => _script != null;

  // "ko-script" field.
  String? _koScript;
  String get koScript => _koScript ?? '';
  set koScript(String? val) => _koScript = val;

  bool hasKoScript() => _koScript != null;

  static DemoRecommendStructStruct fromMap(Map<String, dynamic> data) =>
      DemoRecommendStructStruct(
        s3Url: data['s3Url'] as String?,
        script: data['script'] as String?,
        koScript: data['ko-script'] as String?,
      );

  static DemoRecommendStructStruct? maybeFromMap(dynamic data) => data is Map
      ? DemoRecommendStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        's3Url': _s3Url,
        'script': _script,
        'ko-script': _koScript,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        's3Url': serializeParam(
          _s3Url,
          ParamType.String,
        ),
        'script': serializeParam(
          _script,
          ParamType.String,
        ),
        'ko-script': serializeParam(
          _koScript,
          ParamType.String,
        ),
      }.withoutNulls;

  static DemoRecommendStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DemoRecommendStructStruct(
        s3Url: deserializeParam(
          data['s3Url'],
          ParamType.String,
          false,
        ),
        script: deserializeParam(
          data['script'],
          ParamType.String,
          false,
        ),
        koScript: deserializeParam(
          data['ko-script'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DemoRecommendStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DemoRecommendStructStruct &&
        s3Url == other.s3Url &&
        script == other.script &&
        koScript == other.koScript;
  }

  @override
  int get hashCode => const ListEquality().hash([s3Url, script, koScript]);
}

DemoRecommendStructStruct createDemoRecommendStructStruct({
  String? s3Url,
  String? script,
  String? koScript,
}) =>
    DemoRecommendStructStruct(
      s3Url: s3Url,
      script: script,
      koScript: koScript,
    );

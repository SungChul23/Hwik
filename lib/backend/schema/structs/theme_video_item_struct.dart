// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemeVideoItemStruct extends BaseStruct {
  ThemeVideoItemStruct({
    DemoRecommendStructStruct? recommend,
    SceneStructStruct? scene,
    String? s3Url,
    String? lang,
    String? title,
    String? sk,
  })  : _recommend = recommend,
        _scene = scene,
        _s3Url = s3Url,
        _lang = lang,
        _title = title,
        _sk = sk;

  // "recommend" field.
  DemoRecommendStructStruct? _recommend;
  DemoRecommendStructStruct get recommend =>
      _recommend ?? DemoRecommendStructStruct();
  set recommend(DemoRecommendStructStruct? val) => _recommend = val;

  void updateRecommend(Function(DemoRecommendStructStruct) updateFn) {
    updateFn(_recommend ??= DemoRecommendStructStruct());
  }

  bool hasRecommend() => _recommend != null;

  // "scene" field.
  SceneStructStruct? _scene;
  SceneStructStruct get scene => _scene ?? SceneStructStruct();
  set scene(SceneStructStruct? val) => _scene = val;

  void updateScene(Function(SceneStructStruct) updateFn) {
    updateFn(_scene ??= SceneStructStruct());
  }

  bool hasScene() => _scene != null;

  // "s3Url" field.
  String? _s3Url;
  String get s3Url => _s3Url ?? '';
  set s3Url(String? val) => _s3Url = val;

  bool hasS3Url() => _s3Url != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  set lang(String? val) => _lang = val;

  bool hasLang() => _lang != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "SK" field.
  String? _sk;
  String get sk => _sk ?? '';
  set sk(String? val) => _sk = val;

  bool hasSk() => _sk != null;

  static ThemeVideoItemStruct fromMap(Map<String, dynamic> data) =>
      ThemeVideoItemStruct(
        recommend: data['recommend'] is DemoRecommendStructStruct
            ? data['recommend']
            : DemoRecommendStructStruct.maybeFromMap(data['recommend']),
        scene: data['scene'] is SceneStructStruct
            ? data['scene']
            : SceneStructStruct.maybeFromMap(data['scene']),
        s3Url: data['s3Url'] as String?,
        lang: data['lang'] as String?,
        title: data['title'] as String?,
        sk: data['SK'] as String?,
      );

  static ThemeVideoItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ThemeVideoItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'recommend': _recommend?.toMap(),
        'scene': _scene?.toMap(),
        's3Url': _s3Url,
        'lang': _lang,
        'title': _title,
        'SK': _sk,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recommend': serializeParam(
          _recommend,
          ParamType.DataStruct,
        ),
        'scene': serializeParam(
          _scene,
          ParamType.DataStruct,
        ),
        's3Url': serializeParam(
          _s3Url,
          ParamType.String,
        ),
        'lang': serializeParam(
          _lang,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'SK': serializeParam(
          _sk,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThemeVideoItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThemeVideoItemStruct(
        recommend: deserializeStructParam(
          data['recommend'],
          ParamType.DataStruct,
          false,
          structBuilder: DemoRecommendStructStruct.fromSerializableMap,
        ),
        scene: deserializeStructParam(
          data['scene'],
          ParamType.DataStruct,
          false,
          structBuilder: SceneStructStruct.fromSerializableMap,
        ),
        s3Url: deserializeParam(
          data['s3Url'],
          ParamType.String,
          false,
        ),
        lang: deserializeParam(
          data['lang'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        sk: deserializeParam(
          data['SK'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ThemeVideoItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThemeVideoItemStruct &&
        recommend == other.recommend &&
        scene == other.scene &&
        s3Url == other.s3Url &&
        lang == other.lang &&
        title == other.title &&
        sk == other.sk;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([recommend, scene, s3Url, lang, title, sk]);
}

ThemeVideoItemStruct createThemeVideoItemStruct({
  DemoRecommendStructStruct? recommend,
  SceneStructStruct? scene,
  String? s3Url,
  String? lang,
  String? title,
  String? sk,
}) =>
    ThemeVideoItemStruct(
      recommend: recommend ?? DemoRecommendStructStruct(),
      scene: scene ?? SceneStructStruct(),
      s3Url: s3Url,
      lang: lang,
      title: title,
      sk: sk,
    );

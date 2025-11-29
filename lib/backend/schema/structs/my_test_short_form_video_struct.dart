// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// 영상들 불러와보자
class MyTestShortFormVideoStruct extends BaseStruct {
  MyTestShortFormVideoStruct({
    String? video1,
    String? video2,
    String? video3,
  })  : _video1 = video1,
        _video2 = video2,
        _video3 = video3;

  // "video1" field.
  String? _video1;
  String get video1 =>
      _video1 ??
      'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/test_01.mp4';
  set video1(String? val) => _video1 = val;

  bool hasVideo1() => _video1 != null;

  // "video2" field.
  String? _video2;
  String get video2 =>
      _video2 ??
      'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/test_02.mp4';
  set video2(String? val) => _video2 = val;

  bool hasVideo2() => _video2 != null;

  // "video3" field.
  String? _video3;
  String get video3 =>
      _video3 ??
      'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/test%238895ff8b-b78c-4d7a-bb1c-536dc63c7550.mp4';
  set video3(String? val) => _video3 = val;

  bool hasVideo3() => _video3 != null;

  static MyTestShortFormVideoStruct fromMap(Map<String, dynamic> data) =>
      MyTestShortFormVideoStruct(
        video1: data['video1'] as String?,
        video2: data['video2'] as String?,
        video3: data['video3'] as String?,
      );

  static MyTestShortFormVideoStruct? maybeFromMap(dynamic data) => data is Map
      ? MyTestShortFormVideoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'video1': _video1,
        'video2': _video2,
        'video3': _video3,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'video1': serializeParam(
          _video1,
          ParamType.String,
        ),
        'video2': serializeParam(
          _video2,
          ParamType.String,
        ),
        'video3': serializeParam(
          _video3,
          ParamType.String,
        ),
      }.withoutNulls;

  static MyTestShortFormVideoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MyTestShortFormVideoStruct(
        video1: deserializeParam(
          data['video1'],
          ParamType.String,
          false,
        ),
        video2: deserializeParam(
          data['video2'],
          ParamType.String,
          false,
        ),
        video3: deserializeParam(
          data['video3'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MyTestShortFormVideoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MyTestShortFormVideoStruct &&
        video1 == other.video1 &&
        video2 == other.video2 &&
        video3 == other.video3;
  }

  @override
  int get hashCode => const ListEquality().hash([video1, video2, video3]);
}

MyTestShortFormVideoStruct createMyTestShortFormVideoStruct({
  String? video1,
  String? video2,
  String? video3,
}) =>
    MyTestShortFormVideoStruct(
      video1: video1,
      video2: video2,
      video3: video3,
    );

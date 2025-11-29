// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// STEP4.
///
/// 추천답변
class RecommendedResponseStruct extends BaseStruct {
  RecommendedResponseStruct({
    ///  음성
    String? audioUrl,

    /// 추천답변 (일)
    String? recommendedAnswer,

    /// 발음
    String? pronunciation,

    /// 한국어뜻
    String? koreanTranslation,
  })  : _audioUrl = audioUrl,
        _recommendedAnswer = recommendedAnswer,
        _pronunciation = pronunciation,
        _koreanTranslation = koreanTranslation;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "recommended_answer" field.
  String? _recommendedAnswer;
  String get recommendedAnswer => _recommendedAnswer ?? '';
  set recommendedAnswer(String? val) => _recommendedAnswer = val;

  bool hasRecommendedAnswer() => _recommendedAnswer != null;

  // "pronunciation" field.
  String? _pronunciation;
  String get pronunciation => _pronunciation ?? '';
  set pronunciation(String? val) => _pronunciation = val;

  bool hasPronunciation() => _pronunciation != null;

  // "korean_translation" field.
  String? _koreanTranslation;
  String get koreanTranslation => _koreanTranslation ?? '';
  set koreanTranslation(String? val) => _koreanTranslation = val;

  bool hasKoreanTranslation() => _koreanTranslation != null;

  static RecommendedResponseStruct fromMap(Map<String, dynamic> data) =>
      RecommendedResponseStruct(
        audioUrl: data['audio_url'] as String?,
        recommendedAnswer: data['recommended_answer'] as String?,
        pronunciation: data['pronunciation'] as String?,
        koreanTranslation: data['korean_translation'] as String?,
      );

  static RecommendedResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendedResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'audio_url': _audioUrl,
        'recommended_answer': _recommendedAnswer,
        'pronunciation': _pronunciation,
        'korean_translation': _koreanTranslation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'recommended_answer': serializeParam(
          _recommendedAnswer,
          ParamType.String,
        ),
        'pronunciation': serializeParam(
          _pronunciation,
          ParamType.String,
        ),
        'korean_translation': serializeParam(
          _koreanTranslation,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecommendedResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RecommendedResponseStruct(
        audioUrl: deserializeParam(
          data['audio_url'],
          ParamType.String,
          false,
        ),
        recommendedAnswer: deserializeParam(
          data['recommended_answer'],
          ParamType.String,
          false,
        ),
        pronunciation: deserializeParam(
          data['pronunciation'],
          ParamType.String,
          false,
        ),
        koreanTranslation: deserializeParam(
          data['korean_translation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecommendedResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecommendedResponseStruct &&
        audioUrl == other.audioUrl &&
        recommendedAnswer == other.recommendedAnswer &&
        pronunciation == other.pronunciation &&
        koreanTranslation == other.koreanTranslation;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([audioUrl, recommendedAnswer, pronunciation, koreanTranslation]);
}

RecommendedResponseStruct createRecommendedResponseStruct({
  String? audioUrl,
  String? recommendedAnswer,
  String? pronunciation,
  String? koreanTranslation,
}) =>
    RecommendedResponseStruct(
      audioUrl: audioUrl,
      recommendedAnswer: recommendedAnswer,
      pronunciation: pronunciation,
      koreanTranslation: koreanTranslation,
    );

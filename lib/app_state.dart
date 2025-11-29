import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _preferredLanguage =
          prefs.getString('ff_preferredLanguage') ?? _preferredLanguage;
    });
    _safeInit(() {
      _uuid = prefs.getString('ff_uuid') ?? _uuid;
    });
    _safeInit(() {
      _gender = prefs.getString('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _nickname = prefs.getString('ff_nickname') ?? _nickname;
    });
    _safeInit(() {
      _thumbnailCafe =
          prefs.getStringList('ff_thumbnailCafe') ?? _thumbnailCafe;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// 사진에 대한 카테고리 분류
  ///
  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  /// 이메일 인증 검증 필드
  /// (인증번호 입력창 보이기 여부)
  bool _showVerificationField = false;
  bool get showVerificationField => _showVerificationField;
  set showVerificationField(bool value) {
    _showVerificationField = value;
  }

  /// 숏폼 카테고리 선택
  String _searchShortForm = '';
  String get searchShortForm => _searchShortForm;
  set searchShortForm(String value) {
    _searchShortForm = value;
  }

  /// 이미지 고유 아이디
  String _scenarioId = '';
  String get scenarioId => _scenarioId;
  set scenarioId(String value) {
    _scenarioId = value;
  }

  /// 서버가 인식한 단어 뜻
  String _recognizedWord = '';
  String get recognizedWord => _recognizedWord;
  set recognizedWord(String value) {
    _recognizedWord = value;
  }

  /// Presigned URL 업로드 성공 후 S3 주소 저장
  String _uploadurlWord = '';
  String get uploadurlWord => _uploadurlWord;
  set uploadurlWord(String value) {
    _uploadurlWord = value;
  }

  /// 언어 선택
  String _preferredLanguage = '';
  String get preferredLanguage => _preferredLanguage;
  set preferredLanguage(String value) {
    _preferredLanguage = value;
    prefs.setString('ff_preferredLanguage', value);
  }

  /// 사용자 고유 식별 번호
  String _uuid = '';
  String get uuid => _uuid;
  set uuid(String value) {
    _uuid = value;
    prefs.setString('ff_uuid', value);
  }

  /// 회원가입 성별 선택
  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    prefs.setString('ff_gender', value);
  }

  /// 사용자가 생성한 닉네임
  String _nickname = '';
  String get nickname => _nickname;
  set nickname(String value) {
    _nickname = value;
    prefs.setString('ff_nickname', value);
  }

  /// 인식한 단어 - 파일 경로
  String _fileKey = '';
  String get fileKey => _fileKey;
  set fileKey(String value) {
    _fileKey = value;
  }

  /// 최종단어
  String _originalWord = '';
  String get originalWord => _originalWord;
  set originalWord(String value) {
    _originalWord = value;
  }

  /// 관련단어 4개 출력
  dynamic _relatedWords;
  dynamic get relatedWords => _relatedWords;
  set relatedWords(dynamic value) {
    _relatedWords = value;
  }

  /// 번역 모두 출력
  dynamic _translations;
  dynamic get translations => _translations;
  set translations(dynamic value) {
    _translations = value;
  }

  /// 음성 모두 출력
  dynamic _audioUrls;
  dynamic get audioUrls => _audioUrls;
  set audioUrls(dynamic value) {
    _audioUrls = value;
  }

  /// 서버에서 주는 최종 사진
  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  /// 서버에서 주는 카테고리 리스트
  dynamic _categoryList;
  dynamic get categoryList => _categoryList;
  set categoryList(dynamic value) {
    _categoryList = value;
  }

  /// 사용자 음성 저장 경로
  String _uploadurlSF = '';
  String get uploadurlSF => _uploadurlSF;
  set uploadurlSF(String value) {
    _uploadurlSF = value;
  }

  /// 숏폼에서 음성 녹음하고 저장되는 경로
  String _s3Key = '';
  String get s3Key => _s3Key;
  set s3Key(String value) {
    _s3Key = value;
  }

  List<dynamic> _shortformCategory = [];
  List<dynamic> get shortformCategory => _shortformCategory;
  set shortformCategory(List<dynamic> value) {
    _shortformCategory = value;
  }

  void addToShortformCategory(dynamic value) {
    shortformCategory.add(value);
  }

  void removeFromShortformCategory(dynamic value) {
    shortformCategory.remove(value);
  }

  void removeAtIndexFromShortformCategory(int index) {
    shortformCategory.removeAt(index);
  }

  void updateShortformCategoryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    shortformCategory[index] = updateFn(_shortformCategory[index]);
  }

  void insertAtIndexInShortformCategory(int index, dynamic value) {
    shortformCategory.insert(index, value);
  }

  /// 단어 최종결과에서 상세보기에 필요한 것들
  dynamic _previousLearning;
  dynamic get previousLearning => _previousLearning;
  set previousLearning(dynamic value) {
    _previousLearning = value;
  }

  /// 단어모드에서 학습기록이 있냐?
  bool _hasPreviousLearning = false;
  bool get hasPreviousLearning => _hasPreviousLearning;
  set hasPreviousLearning(bool value) {
    _hasPreviousLearning = value;
  }

  /// 이 단어 본적 있어요 페이지로 가기전
  /// json으로 임시 저장해서 페이지 파라미터로 보내자
  dynamic _tempLearningData;
  dynamic get tempLearningData => _tempLearningData;
  set tempLearningData(dynamic value) {
    _tempLearningData = value;
  }

  /// 메인 화면 "내가 찍은 사진" 담는 변수
  dynamic _weeklyHistory;
  dynamic get weeklyHistory => _weeklyHistory;
  set weeklyHistory(dynamic value) {
    _weeklyHistory = value;
  }

  /// 홈 페이지에서 "이번 주 내가 찍은 사진" 을 클릭 후
  /// 그 사진에 대환 응답을 모두 받는 변수
  dynamic _selectedWordDetail;
  dynamic get selectedWordDetail => _selectedWordDetail;
  set selectedWordDetail(dynamic value) {
    _selectedWordDetail = value;
  }

  /// 숏폼모드에서 사용자 음성 저장 경로
  /// (s3Key 대신임ㅇㅇ)
  String _jobId = '';
  String get jobId => _jobId;
  set jobId(String value) {
    _jobId = value;
  }

  /// 숏폼 최종 결과
  dynamic _shortformFinalResult;
  dynamic get shortformFinalResult => _shortformFinalResult;
  set shortformFinalResult(dynamic value) {
    _shortformFinalResult = value;
  }

  /// 별점 줘
  int _starCounting = 0;
  int get starCounting => _starCounting;
  set starCounting(int value) {
    _starCounting = value;
  }

  /// 모든 숏폼 영상들 가져옴
  dynamic _allShortFormList;
  dynamic get allShortFormList => _allShortFormList;
  set allShortFormList(dynamic value) {
    _allShortFormList = value;
  }

  /// 소캣연결 여부
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  set isConnected(bool value) {
    _isConnected = value;
  }

  /// 소캣에서 수신받은 바디값중 업로드 할 url
  String _uploadUrl = '';
  String get uploadUrl => _uploadUrl;
  set uploadUrl(String value) {
    _uploadUrl = value;
  }

  /// 현재 숏폼 시청
  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int value) {
    _currentPageIndex = value;
  }

  /// 결과창 하드 코딩을 위한 변수
  bool _HARDisKorean = false;
  bool get HARDisKorean => _HARDisKorean;
  set HARDisKorean(bool value) {
    _HARDisKorean = value;
  }

  dynamic _HARDShorFormResultFO = jsonDecode(
      '{\"PK\":\"51657119-211d-4c8b-b5e2-79892ccff514\",\"creationTimestamp\":\"2025-10-14T18:03:06.849671+00:00\",\"feedback\":{\"feedback_comment\":\"음료 주문 상황에 적절한 문장이에요. \'아이스티\'를 주문하는 것도 자연스러운 선택입니다. 문법적으로도 정확하고 공손한 표현을 사용했어요. 다만, 더 정중하게 표현하고 싶다면 \'お願いします\' 대신 \'いただけますか\'를 사용할 수도 있어요.\",\"corrected_sentence\":\"アイスティーをお願いします。\",\"is_correct\":true,\"star_rating\":3},\"gender\":\"female\",\"inputType\":\"foreign\",\"language\":\"jp\",\"nickname\":\"깜빡\",\"recommendedAnswer\":{\"s3Url\":\"https://linkbig-ht-01-lambda-squirrel-storage.s3.amazonaws.com/contents/jp/cafe/audio/cafe_01_recommend_female.mp3?AWSAccessKeyId=ASIA2OAJUA3X2L7H26AT&Signature=oN9etWvfO7nSVkFcvsSAPoggZgQ%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGKRwASuNAIa5EQWGknvk%2Bqx5B%2BdjX0iXAzdS1j7j6RVAiBLltVO0MyujY5fMMg24qbOl6h30KCoYOvZmCadE01KPCrSAwin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDcxNzI3OTcyNTI5NSIMUxgDmBdQ6qHCeavdKqYDvgRV8o3Fw%2Bucd29wdIIDYvB%2BEOHOrmpCCYF8Xrj64VpPt2TTerE9O5cvBIkpz1wPD%2B32tE7SF9SVZlgwscjzc7tx%2FcREEZc5VKWhDO01sxgWiDUjsv9wigrT2bO9tTEUNX3fuU5clR1ppgQqCDd5zK3BkE9he0UBheJSq3NAiKdR4UYJvS4gwnbeVPwQCB0OxUredsP7CdoOQ2jz4gl3NWLR0i4lrdZIa67OO6yVAYnT5vSRRXYUJzGSZQYffqBUFsVAth5j%2Bh3%2Bp9HuWKhU%2BWDtOAOH%2BFE3BWiG6PXvM5LEK7TgMHYKaCMe3IXbuBIPsmzSG%2FG24weBP5MbxAuDKX30jXRTn4Nzf52PGutVcrsTxbpip%2BaUDs3pMtKCK4I%2Bp%2Fn8FwnHyUz05k3wSsdva%2BhF9G9s3BUNTwvj0955%2BdXOKQg2VKN0Sx8Aoof93N%2BATnsh%2FZNYwnZDHSb0r8YJHIWlnlY0wwqH95f3sPsAUFWKySDYWXAckzyiZCW%2BQkQgde5DC5iSDaGJzDWYi4oJvaCYK9YEvWUeK5L8uz4S10lFqhdwaiYwqPv9xwY6nwE5GhgQRqXXmkuOf%2FejfM%2FxsWLAU4oSKSxcb8o8p7ecTUwZHfnYuuRm3pr4Yar6mzb4BY%2Baro1hTvjbawfiBnxGqHgQJpSMjt%2FbXsCSvt8O94pu%2F3YqnEspmYc%2BIVgNxv7CJQb9ywRqa9%2B8Fg2AxU%2F5h9m%2BwiAQ1Xas5kGh3OzyI7l%2BG3WJmdpOpctR5LmXvhh7SNq3e8KgLINRp5vzYsw%3D&Expires=1761577913\",\"script\":\"私はカフェラテをお願いします。\",\"ko-script\":\"저는 카페라떼로 부탁드릴게요.\"},\"resultType\":\"feedback\",\"status\":\"COMPLETED\",\"themeId\":\"cafe\",\"userId\":\"9baf7a1c-8a6d-4aba-be11-889b941fe27c\",\"userInputText\":\"アイスティはお願いします。\",\"videoId\":\"cafe#1\",\"correctionAudioUrl\":\"https://linkbig-ht-01-lambda-squirrel-storage.s3.amazonaws.com/processed-audios/51657119-211d-4c8b-b5e2-79892ccff514_correction.mp3?AWSAccessKeyId=ASIA2OAJUA3X2L7H26AT&Signature=TzTqbdyyQkxXIYE5af6pqm6BPkQ%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGKRwASuNAIa5EQWGknvk%2Bqx5B%2BdjX0iXAzdS1j7j6RVAiBLltVO0MyujY5fMMg24qbOl6h30KCoYOvZmCadE01KPCrSAwin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDcxNzI3OTcyNTI5NSIMUxgDmBdQ6qHCeavdKqYDvgRV8o3Fw%2Bucd29wdIIDYvB%2BEOHOrmpCCYF8Xrj64VpPt2TTerE9O5cvBIkpz1wPD%2B32tE7SF9SVZlgwscjzc7tx%2FcREEZc5VKWhDO01sxgWiDUjsv9wigrT2bO9tTEUNX3fuU5clR1ppgQqCDd5zK3BkE9he0UBheJSq3NAiKdR4UYJvS4gwnbeVPwQCB0OxUredsP7CdoOQ2jz4gl3NWLR0i4lrdZIa67OO6yVAYnT5vSRRXYUJzGSZQYffqBUFsVAth5j%2Bh3%2Bp9HuWKhU%2BWDtOAOH%2BFE3BWiG6PXvM5LEK7TgMHYKaCMe3IXbuBIPsmzSG%2FG24weBP5MbxAuDKX30jXRTn4Nzf52PGutVcrsTxbpip%2BaUDs3pMtKCK4I%2Bp%2Fn8FwnHyUz05k3wSsdva%2BhF9G9s3BUNTwvj0955%2BdXOKQg2VKN0Sx8Aoof93N%2BATnsh%2FZNYwnZDHSb0r8YJHIWlnlY0wwqH95f3sPsAUFWKySDYWXAckzyiZCW%2BQkQgde5DC5iSDaGJzDWYi4oJvaCYK9YEvWUeK5L8uz4S10lFqhdwaiYwqPv9xwY6nwE5GhgQRqXXmkuOf%2FejfM%2FxsWLAU4oSKSxcb8o8p7ecTUwZHfnYuuRm3pr4Yar6mzb4BY%2Baro1hTvjbawfiBnxGqHgQJpSMjt%2FbXsCSvt8O94pu%2F3YqnEspmYc%2BIVgNxv7CJQb9ywRqa9%2B8Fg2AxU%2F5h9m%2BwiAQ1Xas5kGh3OzyI7l%2BG3WJmdpOpctR5LmXvhh7SNq3e8KgLINRp5vzYsw%3D&Expires=1761577913\",\"userInputVoiceUrl\":\"https://linkbig-ht-01-lambda-squirrel-storage.s3.amazonaws.com/user-uploads/9baf7a1c-8a6d-4aba-be11-889b941fe27c/51657119-211d-4c8b-b5e2-79892ccff514.m4a?AWSAccessKeyId=ASIA2OAJUA3X2L7H26AT&Signature=WYDIK98lxhD53j3l89jrN6FmlWk%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGKRwASuNAIa5EQWGknvk%2Bqx5B%2BdjX0iXAzdS1j7j6RVAiBLltVO0MyujY5fMMg24qbOl6h30KCoYOvZmCadE01KPCrSAwin%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDcxNzI3OTcyNTI5NSIMUxgDmBdQ6qHCeavdKqYDvgRV8o3Fw%2Bucd29wdIIDYvB%2BEOHOrmpCCYF8Xrj64VpPt2TTerE9O5cvBIkpz1wPD%2B32tE7SF9SVZlgwscjzc7tx%2FcREEZc5VKWhDO01sxgWiDUjsv9wigrT2bO9tTEUNX3fuU5clR1ppgQqCDd5zK3BkE9he0UBheJSq3NAiKdR4UYJvS4gwnbeVPwQCB0OxUredsP7CdoOQ2jz4gl3NWLR0i4lrdZIa67OO6yVAYnT5vSRRXYUJzGSZQYffqBUFsVAth5j%2Bh3%2Bp9HuWKhU%2BWDtOAOH%2BFE3BWiG6PXvM5LEK7TgMHYKaCMe3IXbuBIPsmzSG%2FG24weBP5MbxAuDKX30jXRTn4Nzf52PGutVcrsTxbpip%2BaUDs3pMtKCK4I%2Bp%2Fn8FwnHyUz05k3wSsdva%2BhF9G9s3BUNTwvj0955%2BdXOKQg2VKN0Sx8Aoof93N%2BATnsh%2FZNYwnZDHSb0r8YJHIWlnlY0wwqH95f3sPsAUFWKySDYWXAckzyiZCW%2BQkQgde5DC5iSDaGJzDWYi4oJvaCYK9YEvWUeK5L8uz4S10lFqhdwaiYwqPv9xwY6nwE5GhgQRqXXmkuOf%2FejfM%2FxsWLAU4oSKSxcb8o8p7ecTUwZHfnYuuRm3pr4Yar6mzb4BY%2Baro1hTvjbawfiBnxGqHgQJpSMjt%2FbXsCSvt8O94pu%2F3YqnEspmYc%2BIVgNxv7CJQb9ywRqa9%2B8Fg2AxU%2F5h9m%2BwiAQ1Xas5kGh3OzyI7l%2BG3WJmdpOpctR5LmXvhh7SNq3e8KgLINRp5vzYsw%3D&Expires=1761577913\"}');
  dynamic get HARDShorFormResultFO => _HARDShorFormResultFO;
  set HARDShorFormResultFO(dynamic value) {
    _HARDShorFormResultFO = value;
  }

  /// 하드코딩 한국어 결과 페이지
  dynamic _HARDShortFormResultKO = jsonDecode(
      '{\"PK\":\"41f9dcc4-4eae-4ae0-9a62-15911354e451\",\"creationTimestamp\":\"2025-10-27T15:09:03.362574+00:00\",\"gender\":\"male\",\"inputType\":\"korean\",\"language\":\"jp\",\"nickname\":\"D아라\",\"originalText\":\"카드로 하고 현금영수증은 필요 없어요.\",\"recommendedAnswer\":{\"s3Url\":\"https://linkbig-ht-01-lambda-squirrel-storage.s3.amazonaws.com/contents/jp/cvs/audio/cvs_02_recommend_male.mp3?AWSAccessKeyId=ASIA2OAJUA3X6ZG5O3PY&Signature=3nGN7%2BsMjL9P4sqJVoFy8yQuxvc%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCP7%2BJSG36B4Q8YDPFiAeoyAFksPz%2B4c0XRt0bdT5A7sAIgK%2F2KEkUG1CwFi6wTQisuB3q1SyfJNonh8tt2eLJqNtEq0gMIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw3MTcyNzk3MjUyOTUiDAtOx%2F5AE62SVRSnMCqmA4o7jMEDgUiwfw8U00NdW06hf1z4Qgarv5KrYRDZX3DrotpyoA2rVUcFZVRL37CGXPtmuBwR7Talqj9kMMgZihMzjYA9b5t0yMtdg2j58BlPokH%2B9zvFCswkn%2BmaLqfcSPmObuIg45JxDkM6D6zWs2HpfsYtSbnrScB2f%2FgAbR6uH6HRm37FnsO5b6DBFAyBxmTGFJGlLSVfG87toY%2BVZWDUiXEwaVAmplRXBApfeYbnErezwa0y7QoaNHHn3REoa95Bjy%2BHw60TmO1ToeMN2nvzpoAhsc08ex17jRwVuxMB3C0LmYUUaFiX7MygJzyjTUzVz370Np0dD7v1mSFyZHNbC2oFTHbCpZcsJteZLKMHSupRQmHzVQ67JEHlfPhZKO54nGah1vkRs9DZEokD%2BYI4C92N6N1XtdLotXeKCT4g%2FTJlt3%2BcKVYEYF8PnaYggiqlDrypzU8ZjwEMKoLvZuxHhAb%2BFXV90tnqBTsP4Qud2al3ggKNymhniOB8bMaXUjCAfAIlAc2d7ckJINtv5ktUf7PZzeQ1IxukQnJtRudG%2Bga%2FII%2FYMK2X%2FscGOp4Bj7KrZgvpRC4dtIGVH255W%2FGcBNgqPdl8XB%2BYujQFM0gWeHXgTzBq%2F3bv%2Bs4FKoXoN%2BSFl28x%2FjqPgtNGDK7mDRIFJb2vuKkNlkaXSeckxfxzgBwElpaQJ0Y5tSjFjWKWHuW1tf8SlRrmFldtPkzpS0nd37DXy7QkGis9XEKKVSPZZee8bSkRTsnmF63l2Mvpc%2FoK3Ne7E%2B8NvzcoqGY%3D&Expires=1761581502\",\"script\":\"現金でお願いします。\",\"ko-script\":\"현금으로 계산해 주세요.\"},\"resultType\":\"translation\",\"status\":\"COMPLETED\",\"themeId\":\"market\",\"translatedText\":\"クレジットカードを使用すれば、現金の領収書は必要ありません。\",\"userId\":\"2058705b-0408-42fb-97c9-e571395b2ee2\",\"videoId\":\"cvs#2\",\"translatedAudioUrl\":\"https://linkbig-ht-01-lambda-squirrel-storage.s3.amazonaws.com/processed-audios/41f9dcc4-4eae-4ae0-9a62-15911354e451_translated.mp3?AWSAccessKeyId=ASIA2OAJUA3X6ZG5O3PY&Signature=eG%2Faf2Eo73W3F%2BTi56EUqwHrc6M%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCP7%2BJSG36B4Q8YDPFiAeoyAFksPz%2B4c0XRt0bdT5A7sAIgK%2F2KEkUG1CwFi6wTQisuB3q1SyfJNonh8tt2eLJqNtEq0gMIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw3MTcyNzk3MjUyOTUiDAtOx%2F5AE62SVRSnMCqmA4o7jMEDgUiwfw8U00NdW06hf1z4Qgarv5KrYRDZX3DrotpyoA2rVUcFZVRL37CGXPtmuBwR7Talqj9kMMgZihMzjYA9b5t0yMtdg2j58BlPokH%2B9zvFCswkn%2BmaLqfcSPmObuIg45JxDkM6D6zWs2HpfsYtSbnrScB2f%2FgAbR6uH6HRm37FnsO5b6DBFAyBxmTGFJGlLSVfG87toY%2BVZWDUiXEwaVAmplRXBApfeYbnErezwa0y7QoaNHHn3REoa95Bjy%2BHw60TmO1ToeMN2nvzpoAhsc08ex17jRwVuxMB3C0LmYUUaFiX7MygJzyjTUzVz370Np0dD7v1mSFyZHNbC2oFTHbCpZcsJteZLKMHSupRQmHzVQ67JEHlfPhZKO54nGah1vkRs9DZEokD%2BYI4C92N6N1XtdLotXeKCT4g%2FTJlt3%2BcKVYEYF8PnaYggiqlDrypzU8ZjwEMKoLvZuxHhAb%2BFXV90tnqBTsP4Qud2al3ggKNymhniOB8bMaXUjCAfAIlAc2d7ckJINtv5ktUf7PZzeQ1IxukQnJtRudG%2Bga%2FII%2FYMK2X%2FscGOp4Bj7KrZgvpRC4dtIGVH255W%2FGcBNgqPdl8XB%2BYujQFM0gWeHXgTzBq%2F3bv%2Bs4FKoXoN%2BSFl28x%2FjqPgtNGDK7mDRIFJb2vuKkNlkaXSeckxfxzgBwElpaQJ0Y5tSjFjWKWHuW1tf8SlRrmFldtPkzpS0nd37DXy7QkGis9XEKKVSPZZee8bSkRTsnmF63l2Mvpc%2FoK3Ne7E%2B8NvzcoqGY%3D&Expires=1761581502\"}');
  dynamic get HARDShortFormResultKO => _HARDShortFormResultKO;
  set HARDShortFormResultKO(dynamic value) {
    _HARDShortFormResultKO = value;
  }

  String _FCMTOKEN = '';
  String get FCMTOKEN => _FCMTOKEN;
  set FCMTOKEN(String value) {
    _FCMTOKEN = value;
  }

  /// 구글 stt 토큰
  String _googleSttToken = '';
  String get googleSttToken => _googleSttToken;
  set googleSttToken(String value) {
    _googleSttToken = value;
  }

  /// 구글 STT에서주는 최종 응답값
  dynamic _finalResultData;
  dynamic get finalResultData => _finalResultData;
  set finalResultData(dynamic value) {
    _finalResultData = value;
  }

  dynamic _googleSTTResult;
  dynamic get googleSTTResult => _googleSTTResult;
  set googleSTTResult(dynamic value) {
    _googleSTTResult = value;
  }

  /// 마이크 컴포넌트가 올라왔는지
  bool _isMicOn = false;
  bool get isMicOn => _isMicOn;
  set isMicOn(bool value) {
    _isMicOn = value;
  }

  /// 에러좀 보자
  String _sttErrorLog = '';
  String get sttErrorLog => _sttErrorLog;
  set sttErrorLog(String value) {
    _sttErrorLog = value;
  }

  /// 학습위젯올라왓니
  bool _isLearningActive = false;
  bool get isLearningActive => _isLearningActive;
  set isLearningActive(bool value) {
    _isLearningActive = value;
  }

  List<DemoFeedItemTypeStruct> _feedListCache = [];
  List<DemoFeedItemTypeStruct> get feedListCache => _feedListCache;
  set feedListCache(List<DemoFeedItemTypeStruct> value) {
    _feedListCache = value;
  }

  void addToFeedListCache(DemoFeedItemTypeStruct value) {
    feedListCache.add(value);
  }

  void removeFromFeedListCache(DemoFeedItemTypeStruct value) {
    feedListCache.remove(value);
  }

  void removeAtIndexFromFeedListCache(int index) {
    feedListCache.removeAt(index);
  }

  void updateFeedListCacheAtIndex(
    int index,
    DemoFeedItemTypeStruct Function(DemoFeedItemTypeStruct) updateFn,
  ) {
    feedListCache[index] = updateFn(_feedListCache[index]);
  }

  void insertAtIndexInFeedListCache(int index, DemoFeedItemTypeStruct value) {
    feedListCache.insert(index, value);
  }

  /// 스텝3의 최종 결과물
  dynamic _step3PronunciationData;
  dynamic get step3PronunciationData => _step3PronunciationData;
  set step3PronunciationData(dynamic value) {
    _step3PronunciationData = value;
  }

  /// 스텝4에 대한 피드백
  bool _step4FeedbackOn = false;
  bool get step4FeedbackOn => _step4FeedbackOn;
  set step4FeedbackOn(bool value) {
    _step4FeedbackOn = value;
  }

  String _step4language = '';
  String get step4language => _step4language;
  set step4language(String value) {
    _step4language = value;
  }

  /// 한국어 혹은 외국어 분기문을 위한 변수
  String _step4ResultType = '';
  String get step4ResultType => _step4ResultType;
  set step4ResultType(String value) {
    _step4ResultType = value;
  }

  /// step 창 떳나요 ?
  bool _isQuizExpanded = false;
  bool get isQuizExpanded => _isQuizExpanded;
  set isQuizExpanded(bool value) {
    _isQuizExpanded = value;
  }

  /// 스텝3 답 왔나
  bool _step3FeedbackOn = false;
  bool get step3FeedbackOn => _step3FeedbackOn;
  set step3FeedbackOn(bool value) {
    _step3FeedbackOn = value;
  }

  /// 잠깐 테스트 영상
  List<String> _tsetVideo = [
    'https://s3-cloudfront-test-veo3.s3.us-east-1.amazonaws.com/5.mp4?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLWVhc3QtMSJGMEQCIEwnFsSAuDLo5AHuI%2FdcX1bJUEfcxYT%2FefzNBajMKO%2FyAiAGDkbKVSq12pZRsSuE%2B9Ko%2Fn6sD9Qn2WR4r6tXfiR6Kyq5AwgUEAAaDDY2NDI0NzYxMzk0OCIMnIamDwQmj7ZoMGx3KpYDLmF58vF92C3jbVoABecLjkcrjlKqAUB09LgABYvS11O%2BbtNCU33E2UFKiLKgPzDKXVNdLKM1dIE2qdOfuszvASpeVSnHCzG3Ur6WA%2B4HB9zuHJReKjVIW%2FDT6j7qsEvSxl2yGEQK6vOsMNDmslOlLNJAui%2FfLUrAYeB%2BvxYtJEdDOoQ%2By0WOkTDsZl3Lm4jQA5scLdIabgb2HJ%2ByYlVgTtIfLowxS%2FGDuzZruScvaABJRKD43L8n7VtCstOKOB%2Ftr0UFLk2R7MKZ4t3bh69Zolx9960tKyDN73tz7nD0L8i3VpVNH96sXHE2dIf2zN2vPpkW2tSaM0M5MYkrkgRyOq5HFH5JxwWhXRl%2FdIKrTbw92JQ8EVh%2BWuWDAkmrFj39L9DBmqYyDjDuaoIc4ubRcec8AjUkhLONGZxb6q86YCLhp3efLWwuVgk0uIqKeyib1V9oeBt30KAPjhXtZKKrZl2o9v6Xck1OX2D5FeH%2FATSWF4QyMMSHWEHIHT%2F0LNen%2BYKOa0kj6YWI8z3YgGHbBMFUANuh7jDf3ILJBjrfAtOVrs41XTXnbTPZCiaGIDJk6Y3bFLQeXtMjS1%2Fp8FT4buznznkkoyKom%2BVuP1J8vX%2BbadU1N0EJKKSm%2BxwSMj64npCehq7Gt3oMXYyZ%2BTF5NQd3H4r4R1HcOa3PKFBSszzCAGrL23KeZlpLKMjy5JiBcxwP1%2BDBfTdZoBEEgH9yoIs7Dk8oGXHKU1jlSKVxtNguY2q5piI%2BbYx3pUa7cMpo50pxNHt3p%2Ft9ZxT9NrLlfkn57jZ6hvO%2Bzyopm8PEz4wCTCehR0pjijhC581Wn%2Fs7kzrhT9cU6C6nfjZgWHZ1VQh2W%2BM5e6JMcqKbF%2FADQK3enTAZ5QwerOS0uROLg2evQVm0%2FfLc56lNgkWLQtekL%2BZXb9yMS7ZZpCnHAnPVaky0IKsbOlWGDQXp4fk%2F2O%2FrdZpN7tuH%2Bz64nYbeqT8GrIc3jutT5E1NMZTW5FRAHl4wKDBiorIeYxJ3aCr%2FIg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAZVKB6HH6ABS5S6KK%2F20251121%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251121T184736Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=6af5f35a855920ed2cdfaeb30034ddac35d7baec3588f2eccfee03fc768903f6',
    'https://s3-cloudfront-test-veo3.s3.us-east-1.amazonaws.com/6.mp4?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLWVhc3QtMSJGMEQCIEwnFsSAuDLo5AHuI%2FdcX1bJUEfcxYT%2FefzNBajMKO%2FyAiAGDkbKVSq12pZRsSuE%2B9Ko%2Fn6sD9Qn2WR4r6tXfiR6Kyq5AwgUEAAaDDY2NDI0NzYxMzk0OCIMnIamDwQmj7ZoMGx3KpYDLmF58vF92C3jbVoABecLjkcrjlKqAUB09LgABYvS11O%2BbtNCU33E2UFKiLKgPzDKXVNdLKM1dIE2qdOfuszvASpeVSnHCzG3Ur6WA%2B4HB9zuHJReKjVIW%2FDT6j7qsEvSxl2yGEQK6vOsMNDmslOlLNJAui%2FfLUrAYeB%2BvxYtJEdDOoQ%2By0WOkTDsZl3Lm4jQA5scLdIabgb2HJ%2ByYlVgTtIfLowxS%2FGDuzZruScvaABJRKD43L8n7VtCstOKOB%2Ftr0UFLk2R7MKZ4t3bh69Zolx9960tKyDN73tz7nD0L8i3VpVNH96sXHE2dIf2zN2vPpkW2tSaM0M5MYkrkgRyOq5HFH5JxwWhXRl%2FdIKrTbw92JQ8EVh%2BWuWDAkmrFj39L9DBmqYyDjDuaoIc4ubRcec8AjUkhLONGZxb6q86YCLhp3efLWwuVgk0uIqKeyib1V9oeBt30KAPjhXtZKKrZl2o9v6Xck1OX2D5FeH%2FATSWF4QyMMSHWEHIHT%2F0LNen%2BYKOa0kj6YWI8z3YgGHbBMFUANuh7jDf3ILJBjrfAtOVrs41XTXnbTPZCiaGIDJk6Y3bFLQeXtMjS1%2Fp8FT4buznznkkoyKom%2BVuP1J8vX%2BbadU1N0EJKKSm%2BxwSMj64npCehq7Gt3oMXYyZ%2BTF5NQd3H4r4R1HcOa3PKFBSszzCAGrL23KeZlpLKMjy5JiBcxwP1%2BDBfTdZoBEEgH9yoIs7Dk8oGXHKU1jlSKVxtNguY2q5piI%2BbYx3pUa7cMpo50pxNHt3p%2Ft9ZxT9NrLlfkn57jZ6hvO%2Bzyopm8PEz4wCTCehR0pjijhC581Wn%2Fs7kzrhT9cU6C6nfjZgWHZ1VQh2W%2BM5e6JMcqKbF%2FADQK3enTAZ5QwerOS0uROLg2evQVm0%2FfLc56lNgkWLQtekL%2BZXb9yMS7ZZpCnHAnPVaky0IKsbOlWGDQXp4fk%2F2O%2FrdZpN7tuH%2Bz64nYbeqT8GrIc3jutT5E1NMZTW5FRAHl4wKDBiorIeYxJ3aCr%2FIg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAZVKB6HH6ABS5S6KK%2F20251121%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251121T184754Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=67fe6c7febd3200fcfcb1f65f060953ad9e2b5c15a3cf4e24bfaa5ab20fd0a8b',
    'https://s3-cloudfront-test-veo3.s3.us-east-1.amazonaws.com/7.mp4?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLWVhc3QtMSJGMEQCIEwnFsSAuDLo5AHuI%2FdcX1bJUEfcxYT%2FefzNBajMKO%2FyAiAGDkbKVSq12pZRsSuE%2B9Ko%2Fn6sD9Qn2WR4r6tXfiR6Kyq5AwgUEAAaDDY2NDI0NzYxMzk0OCIMnIamDwQmj7ZoMGx3KpYDLmF58vF92C3jbVoABecLjkcrjlKqAUB09LgABYvS11O%2BbtNCU33E2UFKiLKgPzDKXVNdLKM1dIE2qdOfuszvASpeVSnHCzG3Ur6WA%2B4HB9zuHJReKjVIW%2FDT6j7qsEvSxl2yGEQK6vOsMNDmslOlLNJAui%2FfLUrAYeB%2BvxYtJEdDOoQ%2By0WOkTDsZl3Lm4jQA5scLdIabgb2HJ%2ByYlVgTtIfLowxS%2FGDuzZruScvaABJRKD43L8n7VtCstOKOB%2Ftr0UFLk2R7MKZ4t3bh69Zolx9960tKyDN73tz7nD0L8i3VpVNH96sXHE2dIf2zN2vPpkW2tSaM0M5MYkrkgRyOq5HFH5JxwWhXRl%2FdIKrTbw92JQ8EVh%2BWuWDAkmrFj39L9DBmqYyDjDuaoIc4ubRcec8AjUkhLONGZxb6q86YCLhp3efLWwuVgk0uIqKeyib1V9oeBt30KAPjhXtZKKrZl2o9v6Xck1OX2D5FeH%2FATSWF4QyMMSHWEHIHT%2F0LNen%2BYKOa0kj6YWI8z3YgGHbBMFUANuh7jDf3ILJBjrfAtOVrs41XTXnbTPZCiaGIDJk6Y3bFLQeXtMjS1%2Fp8FT4buznznkkoyKom%2BVuP1J8vX%2BbadU1N0EJKKSm%2BxwSMj64npCehq7Gt3oMXYyZ%2BTF5NQd3H4r4R1HcOa3PKFBSszzCAGrL23KeZlpLKMjy5JiBcxwP1%2BDBfTdZoBEEgH9yoIs7Dk8oGXHKU1jlSKVxtNguY2q5piI%2BbYx3pUa7cMpo50pxNHt3p%2Ft9ZxT9NrLlfkn57jZ6hvO%2Bzyopm8PEz4wCTCehR0pjijhC581Wn%2Fs7kzrhT9cU6C6nfjZgWHZ1VQh2W%2BM5e6JMcqKbF%2FADQK3enTAZ5QwerOS0uROLg2evQVm0%2FfLc56lNgkWLQtekL%2BZXb9yMS7ZZpCnHAnPVaky0IKsbOlWGDQXp4fk%2F2O%2FrdZpN7tuH%2Bz64nYbeqT8GrIc3jutT5E1NMZTW5FRAHl4wKDBiorIeYxJ3aCr%2FIg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAZVKB6HH6ABS5S6KK%2F20251121%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251121T184808Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=491fc113e8db88a6de6093396b1aefa0643985a4bcc44e87a5b4b36295eecd61\n',
    'https://s3-cloudfront-test-veo3.s3.us-east-1.amazonaws.com/8.mp4?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEsaCXVzLWVhc3QtMSJGMEQCIEwnFsSAuDLo5AHuI%2FdcX1bJUEfcxYT%2FefzNBajMKO%2FyAiAGDkbKVSq12pZRsSuE%2B9Ko%2Fn6sD9Qn2WR4r6tXfiR6Kyq5AwgUEAAaDDY2NDI0NzYxMzk0OCIMnIamDwQmj7ZoMGx3KpYDLmF58vF92C3jbVoABecLjkcrjlKqAUB09LgABYvS11O%2BbtNCU33E2UFKiLKgPzDKXVNdLKM1dIE2qdOfuszvASpeVSnHCzG3Ur6WA%2B4HB9zuHJReKjVIW%2FDT6j7qsEvSxl2yGEQK6vOsMNDmslOlLNJAui%2FfLUrAYeB%2BvxYtJEdDOoQ%2By0WOkTDsZl3Lm4jQA5scLdIabgb2HJ%2ByYlVgTtIfLowxS%2FGDuzZruScvaABJRKD43L8n7VtCstOKOB%2Ftr0UFLk2R7MKZ4t3bh69Zolx9960tKyDN73tz7nD0L8i3VpVNH96sXHE2dIf2zN2vPpkW2tSaM0M5MYkrkgRyOq5HFH5JxwWhXRl%2FdIKrTbw92JQ8EVh%2BWuWDAkmrFj39L9DBmqYyDjDuaoIc4ubRcec8AjUkhLONGZxb6q86YCLhp3efLWwuVgk0uIqKeyib1V9oeBt30KAPjhXtZKKrZl2o9v6Xck1OX2D5FeH%2FATSWF4QyMMSHWEHIHT%2F0LNen%2BYKOa0kj6YWI8z3YgGHbBMFUANuh7jDf3ILJBjrfAtOVrs41XTXnbTPZCiaGIDJk6Y3bFLQeXtMjS1%2Fp8FT4buznznkkoyKom%2BVuP1J8vX%2BbadU1N0EJKKSm%2BxwSMj64npCehq7Gt3oMXYyZ%2BTF5NQd3H4r4R1HcOa3PKFBSszzCAGrL23KeZlpLKMjy5JiBcxwP1%2BDBfTdZoBEEgH9yoIs7Dk8oGXHKU1jlSKVxtNguY2q5piI%2BbYx3pUa7cMpo50pxNHt3p%2Ft9ZxT9NrLlfkn57jZ6hvO%2Bzyopm8PEz4wCTCehR0pjijhC581Wn%2Fs7kzrhT9cU6C6nfjZgWHZ1VQh2W%2BM5e6JMcqKbF%2FADQK3enTAZ5QwerOS0uROLg2evQVm0%2FfLc56lNgkWLQtekL%2BZXb9yMS7ZZpCnHAnPVaky0IKsbOlWGDQXp4fk%2F2O%2FrdZpN7tuH%2Bz64nYbeqT8GrIc3jutT5E1NMZTW5FRAHl4wKDBiorIeYxJ3aCr%2FIg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAZVKB6HH6ABS5S6KK%2F20251121%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251121T184819Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=52a60bfa85db60af8d5c8a48037fb4fef9cb48021a975f7af18d67a9f362faa6'
  ];
  List<String> get tsetVideo => _tsetVideo;
  set tsetVideo(List<String> value) {
    _tsetVideo = value;
  }

  void addToTsetVideo(String value) {
    tsetVideo.add(value);
  }

  void removeFromTsetVideo(String value) {
    tsetVideo.remove(value);
  }

  void removeAtIndexFromTsetVideo(int index) {
    tsetVideo.removeAt(index);
  }

  void updateTsetVideoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tsetVideo[index] = updateFn(_tsetVideo[index]);
  }

  void insertAtIndexInTsetVideo(int index, String value) {
    tsetVideo.insert(index, value);
  }

  List<String> _cloudFrontTest = [
    'https://d18jqzlmiiaocq.cloudfront.net/5.mp4',
    'https://d18jqzlmiiaocq.cloudfront.net/6.mp4',
    'https://d18jqzlmiiaocq.cloudfront.net/7.mp4',
    'https://d18jqzlmiiaocq.cloudfront.net/8.mp4'
  ];
  List<String> get cloudFrontTest => _cloudFrontTest;
  set cloudFrontTest(List<String> value) {
    _cloudFrontTest = value;
  }

  void addToCloudFrontTest(String value) {
    cloudFrontTest.add(value);
  }

  void removeFromCloudFrontTest(String value) {
    cloudFrontTest.remove(value);
  }

  void removeAtIndexFromCloudFrontTest(int index) {
    cloudFrontTest.removeAt(index);
  }

  void updateCloudFrontTestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cloudFrontTest[index] = updateFn(_cloudFrontTest[index]);
  }

  void insertAtIndexInCloudFrontTest(int index, String value) {
    cloudFrontTest.insert(index, value);
  }

  List<String> _thumbnailCVS = [
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cvs1.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cvs2.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cvs3.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cvs4.png'
  ];
  List<String> get thumbnailCVS => _thumbnailCVS;
  set thumbnailCVS(List<String> value) {
    _thumbnailCVS = value;
  }

  void addToThumbnailCVS(String value) {
    thumbnailCVS.add(value);
  }

  void removeFromThumbnailCVS(String value) {
    thumbnailCVS.remove(value);
  }

  void removeAtIndexFromThumbnailCVS(int index) {
    thumbnailCVS.removeAt(index);
  }

  void updateThumbnailCVSAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    thumbnailCVS[index] = updateFn(_thumbnailCVS[index]);
  }

  void insertAtIndexInThumbnailCVS(int index, String value) {
    thumbnailCVS.insert(index, value);
  }

  List<String> _thumbnailRes = [
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/res1.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/res2.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/res3.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/res4.png'
  ];
  List<String> get thumbnailRes => _thumbnailRes;
  set thumbnailRes(List<String> value) {
    _thumbnailRes = value;
  }

  void addToThumbnailRes(String value) {
    thumbnailRes.add(value);
  }

  void removeFromThumbnailRes(String value) {
    thumbnailRes.remove(value);
  }

  void removeAtIndexFromThumbnailRes(int index) {
    thumbnailRes.removeAt(index);
  }

  void updateThumbnailResAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    thumbnailRes[index] = updateFn(_thumbnailRes[index]);
  }

  void insertAtIndexInThumbnailRes(int index, String value) {
    thumbnailRes.insert(index, value);
  }

  List<String> _thumbnailCafe = [
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cafe1.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/caf2.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cafe3.png',
    'https://shortform-test-video.s3.ap-northeast-2.amazonaws.com/thumbnail/cafe4.png'
  ];
  List<String> get thumbnailCafe => _thumbnailCafe;
  set thumbnailCafe(List<String> value) {
    _thumbnailCafe = value;
    prefs.setStringList('ff_thumbnailCafe', value);
  }

  void addToThumbnailCafe(String value) {
    thumbnailCafe.add(value);
    prefs.setStringList('ff_thumbnailCafe', _thumbnailCafe);
  }

  void removeFromThumbnailCafe(String value) {
    thumbnailCafe.remove(value);
    prefs.setStringList('ff_thumbnailCafe', _thumbnailCafe);
  }

  void removeAtIndexFromThumbnailCafe(int index) {
    thumbnailCafe.removeAt(index);
    prefs.setStringList('ff_thumbnailCafe', _thumbnailCafe);
  }

  void updateThumbnailCafeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    thumbnailCafe[index] = updateFn(_thumbnailCafe[index]);
    prefs.setStringList('ff_thumbnailCafe', _thumbnailCafe);
  }

  void insertAtIndexInThumbnailCafe(int index, String value) {
    thumbnailCafe.insert(index, value);
    prefs.setStringList('ff_thumbnailCafe', _thumbnailCafe);
  }

  List<String> _thumbnailCVS2 = [
    'https://picsum.photos/seed/203/600',
    'https://picsum.photos/seed/712/600'
  ];
  List<String> get thumbnailCVS2 => _thumbnailCVS2;
  set thumbnailCVS2(List<String> value) {
    _thumbnailCVS2 = value;
  }

  void addToThumbnailCVS2(String value) {
    thumbnailCVS2.add(value);
  }

  void removeFromThumbnailCVS2(String value) {
    thumbnailCVS2.remove(value);
  }

  void removeAtIndexFromThumbnailCVS2(int index) {
    thumbnailCVS2.removeAt(index);
  }

  void updateThumbnailCVS2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    thumbnailCVS2[index] = updateFn(_thumbnailCVS2[index]);
  }

  void insertAtIndexInThumbnailCVS2(int index, String value) {
    thumbnailCVS2.insert(index, value);
  }

  /// 소리가 들리는가
  bool _isSoundOn = false;
  bool get isSoundOn => _isSoundOn;
  set isSoundOn(bool value) {
    _isSoundOn = value;
  }

  /// 하단바 순서
  int _navIndex = 0;
  int get navIndex => _navIndex;
  set navIndex(int value) {
    _navIndex = value;
  }

  /// 팁 활성화
  bool _isTipVisible = false;
  bool get isTipVisible => _isTipVisible;
  set isTipVisible(bool value) {
    _isTipVisible = value;
  }

  final _cVSCasheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cVSCashe({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cVSCasheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCVSCasheCache() => _cVSCasheManager.clear();
  void clearCVSCasheCacheKey(String? uniqueKey) =>
      _cVSCasheManager.clearRequest(uniqueKey);

  final _themeShortformVideoListManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> themeShortformVideoList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _themeShortformVideoListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearThemeShortformVideoListCache() =>
      _themeShortformVideoListManager.clear();
  void clearThemeShortformVideoListCacheKey(String? uniqueKey) =>
      _themeShortformVideoListManager.clearRequest(uniqueKey);

  final _cafeCasheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cafeCashe({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cafeCasheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCafeCasheCache() => _cafeCasheManager.clear();
  void clearCafeCasheCacheKey(String? uniqueKey) =>
      _cafeCasheManager.clearRequest(uniqueKey);

  final _resCasheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> resCashe({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _resCasheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearResCasheCache() => _resCasheManager.clear();
  void clearResCasheCacheKey(String? uniqueKey) =>
      _resCasheManager.clearRequest(uniqueKey);

  final _mainShortFormVideoManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> mainShortFormVideo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _mainShortFormVideoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMainShortFormVideoCache() => _mainShortFormVideoManager.clear();
  void clearMainShortFormVideoCacheKey(String? uniqueKey) =>
      _mainShortFormVideoManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

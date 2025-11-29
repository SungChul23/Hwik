import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPresignedUrlCall {
  static Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPresignedUrl',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/word-mode/presigned-url/jpg',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RecognitionCall {
  static Future<ApiCallResponse> call({
    String? scenarioId = '',
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Recognition',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/word-mode/recognition/${scenarioId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? nickname = '',
    String? gender = '',
    String? fcmToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "nickname": "${nickname}",
  "gender": "${gender}",
  "fcm_token": "${fcmToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/signUp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WordFinalResultCall {
  static Future<ApiCallResponse> call({
    String? scenarioId = '',
    String? fileKey = '',
    String? originalWord = '',
    String? targetLanguage = '',
    String? uuid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "scenarioId": "${scenarioId}",
  "fileKey": "${fileKey}",
  "originalWord": "${originalWord}",
  "targetLanguage": "${targetLanguage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'WordFinalResult',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/word-mode/confirm',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShowThemeCall {
  static Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShowTheme',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/themes',
      callType: ApiCallType.GET,
      headers: {
        'uuid': '${uuid}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? themeId(dynamic response) => (getJsonField(
        response,
        r'''$[:].themeId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ShortFormDetailCall {
  static Future<ApiCallResponse> call({
    String? preferredLanguage = '',
    String? themeId = '',
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShortFormDetail',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/videos/${preferredLanguage}/${themeId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadVoiceCall {
  static Future<ApiCallResponse> call({
    String? uuid = '',
    String? preferredLanguage = '',
    String? themeId = '',
    String? videoId = '',
    String? inputType = '',
    String? fileExtension = 'm4a',
  }) async {
    final ffApiRequestBody = '''
{
  "language": "${preferredLanguage}",
  "themeId": "${themeId}",
  "videoId": "${videoId}",
  "fileExtension": "m4a",
  "inputType": "${inputType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UploadVoice',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/presigned-url',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WordDetailSearchCall {
  static Future<ApiCallResponse> call({
    String? learnedAtTs = '',
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'WordDetailSearch',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/word-mode/details/${learnedAtTs}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WordWeeklyHistoryCall {
  static Future<ApiCallResponse> call({
    String? targetLanguage = '',
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'WordWeeklyHistory',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/word-mode/weekly-history/${targetLanguage}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShortFormFinalResultCall {
  static Future<ApiCallResponse> call({
    String? uuid = '',
    String? jobId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShortFormFinalResult',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/tasks/${jobId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MainShortFormViewCall {
  static Future<ApiCallResponse> call({
    String? uuid = '',
    String? targetLanguage = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MainShortFormView',
      apiUrl:
          'https://qvevmisesk.execute-api.us-east-1.amazonaws.com/dev/short-form/feed',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uuid': '${uuid}',
      },
      params: {
        'lang': targetLanguage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? feed(dynamic response) => getJsonField(
        response,
        r'''$.feed''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

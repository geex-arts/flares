import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ParseSiteCall {
  static Future<ApiCallResponse> call({
    String? url = '',
  }) async {
    final ffApiRequestBody = '''
{"url":"$url"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'parseSite',
      apiUrl:
          'https://gkjpgyieiugznobskhlt.supabase.co/functions/v1/parse-site',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdranBneWllaXVnem5vYnNraGx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODQyMzUsImV4cCI6MjAyMzU2MDIzNX0.ulHur9jh5q99iNT1AcnjKD7f8JEQj52GPLz2NESiW64',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateAiWishCall {
  static Future<ApiCallResponse> call({
    String? city = '',
    String? budget = '',
    String? interest = '',
  }) async {
    final ffApiRequestBody = '''
{
 "city":"$city",
 "interest": "$interest",
 "budget":"$budget"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateAiWish',
      apiUrl:
          'https://gkjpgyieiugznobskhlt.supabase.co/functions/v1/generate-ai-wish',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdranBneWllaXVnem5vYnNraGx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODQyMzUsImV4cCI6MjAyMzU2MDIzNX0.ulHur9jh5q99iNT1AcnjKD7f8JEQj52GPLz2NESiW64',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateAiSimiliarWishCall {
  static Future<ApiCallResponse> call({
    String? budget = '',
    String? city = '',
    String? collectionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "budget": "$budget",
  "city": "$city",
  "collection_id": "$collectionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateAiSimiliarWish',
      apiUrl:
          'https://gkjpgyieiugznobskhlt.supabase.co/functions/v1/generate-ai-similiar-wishes',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdranBneWllaXVnem5vYnNraGx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODQyMzUsImV4cCI6MjAyMzU2MDIzNX0.ulHur9jh5q99iNT1AcnjKD7f8JEQj52GPLz2NESiW64',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

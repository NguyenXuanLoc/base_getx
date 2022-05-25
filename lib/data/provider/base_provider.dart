import 'dart:convert';

import 'package:docsify/data/provider/api_result.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/utils/connection_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BaseProvider extends GetConnect {
  void initProvider() {
    httpClient.baseUrl = dotenv.env['BASE_API'];
    httpClient.timeout = Duration(seconds: globals.timeOut);
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> GET(String url, {Map<String, dynamic>? queryParam}) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: LocaleKeys.network_error.tr);
    }
    print('============================================================');
    print('[GET] ' + httpClient.baseUrl! + url);
    print("Bearer " + globals.accessToken);
    try {
      final response = await get(url,
          headers: {
            'Authorization': 'Bearer ${globals.accessToken}',
            'Host': 'auth.com'
          },
          query: queryParam);
      logE("REQUEST: ${response.request?.url.toString()}");
      if (response.isOk && response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          data: result,
        );
      } else {
        Logger().e('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    }
  }

  Future<ApiResult> PATCH(String url, dynamic body) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: LocaleKeys.network_error.tr);
    }
    print('============================================================');
    print('[PATCH] ' + httpClient.baseUrl! + url);
    print('[PARAMS] ' + body.toString());
    print("Bearer " + globals.accessToken);

    try {
      final response = await patch(
        url,
        body,
        headers: {
          'Authorization': 'Bearer ${globals.accessToken}',
          'Host': 'auth.com'
        },
      );
      if (response.isOk && response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> POST(
    String url,
    dynamic body,
  ) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: LocaleKeys.network_error.tr);
    }
    print('============================================================');
    print('[POST] ' + httpClient.baseUrl! + url);
    print("Bearer " + globals.accessToken);
    print('[PARAMS] ' + jsonEncode(body.toString()));
    try {
      final response = await post(
        url,
        jsonEncode(body),
        headers: {
          'Authorization': 'Bearer ${globals.accessToken}',
          'Host': 'auth.com'
        },
      );
      Logger().d(response.body);
      if (response.isOk && response.body != null) {
        var result = response.body;
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: LocaleKeys.network_error.tr,
      );
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> PUT(String url, dynamic body) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: LocaleKeys.network_error.tr);
    }
    print('============================================================');
    print('[PUT] ' + httpClient.baseUrl! + url);
    print('[PARAMS] ' + body.toString());
    try {
      final response = await put(
        url,
        body,
        headers: {
          'Authorization': 'Bearer ${globals.accessToken}',
          'Host': 'auth.com'
        },
      );
      if (response.isOk && response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> DELETE(String url) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: LocaleKeys.network_error.tr);
    }
    print('============================================================');
    print('[DELETE] ' + httpClient.baseUrl! + url);
    try {
      final response = await delete(
        url,
        headers: {
          'Authorization': 'Bearer ${globals.accessToken}',
          'Host': 'auth.com'
        },
      );
      if (response.isOk && response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: LocaleKeys.network_error.tr);
    }
  }
}

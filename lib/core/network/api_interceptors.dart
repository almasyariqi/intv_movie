import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("URL");
    debugPrint(options.uri.toString());
    debugPrint("Headers: ");
    debugPrint(options.headers.toString());
    debugPrint("Data: ");
    debugPrint(options.data.toString());
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint("StatusCode: ${err.response?.statusCode.toString()}");
    debugPrint("Error Message: ${err.response?.statusMessage}");
    return handler.next(err);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint("RESPONSE DATA: ");
    debugPrint(response.data.toString());
    debugPrint(response.statusCode.toString());
    return handler.next(response);
  }
}
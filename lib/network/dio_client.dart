import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/network/dio_exceptions.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'endpoints.dart';
import 'interceptors/authorization_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            // baseUrl: ApiConstant.base_url,
            connectTimeout:
                const Duration(seconds: Endpoints.connectionTimeout),
            receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
            responseType: ResponseType.json,
            // responseType: ResponseType.json,
            contentType: ContentType.json.toString(),
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            DioInterceptor(),
          ]);

  late final Dio _dio;

  Future<Response> get(
      {Map<String, dynamic>? data,
      required String endPoint,
      String baseUrl = Endpoints.baseUrl}) async {
    try {
      final url = baseUrl + endPoint;
      final response = await _dio.get(url);
      return response;
    } on DioException catch (err) {
      final errorMessage = DioDynamicException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}

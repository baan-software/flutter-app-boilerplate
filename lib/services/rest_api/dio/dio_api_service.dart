import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/services/rest_api/dio/dio_auth_token_interceptor.dart';
import 'package:flutter_boilerplate/services/rest_api/request.dart';
import 'package:flutter_boilerplate/services/rest_api/rest_api_service.dart';

class DioApiService implements RestApiService {
  late final Dio _dio;

  DioApiService({
    required String baseUrl,
    required Future<String> Function() getAuthToken,
    required Future<bool> Function() refreshAuthToken
  }) {
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        )
    );
    
    _dio.interceptors.add(DioAuthTokenInterceptor(
      _dio, 
      getAuthToken,
      refreshAuthToken
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final httpClient = HttpClient();
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return httpClient;
      }
    );
  }

  @override
  Future<Response> get(Request request) async {
    try {
      return await _dio.get(
        request.url,
        options: Options(
          method: 'GET',
          headers: request.headers,
        ),
        queryParameters: request.queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> post(Request request) async {
    try {
      return await _dio.post(
        request.url,
        data: request.data,
        options: Options(
          method: 'POST',
          headers: request.headers,
        ),
        queryParameters: request.queryParameters,);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> put(Request request) async {
    try {
      return await _dio.put(
        request.url,
        data: request.data,
        options: Options(
          method: 'PUT',
          headers: request.headers,
        ),
        queryParameters: request.queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> delete(Request request) async {
    try {
      return await _dio.delete(
        request.url,
        options: Options(
          method: 'DELETE',
          headers: request.headers,
        ),
        queryParameters: request.queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }
} 
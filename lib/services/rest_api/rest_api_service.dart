import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/services/rest_api/request.dart';

abstract class RestApiService {
  Future<Response> get(Request request);
  Future<Response> post(Request request);
  Future<Response> put(Request request);
  Future<Response> delete(Request request);
} 
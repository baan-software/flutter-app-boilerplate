import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/services/storage/key_value_storage.dart';
import 'package:flutter_boilerplate/services/storage/secure_key_value_storage.dart';
import 'package:flutter_boilerplate/services/storage/auth_tokens_storage.dart';
import 'package:flutter_boilerplate/services/storage/auth_tokens_storage_impl.dart';
import 'package:flutter_boilerplate/services/rest_api/rest_api_service.dart';
import 'package:flutter_boilerplate/services/rest_api/dio/dio_api_service.dart';

part 'services_providers.g.dart';

@riverpod
KeyValueStorage keyValueStorage(Ref ref) {
  return SecureKeyValueStorage();
}

@riverpod
AuthTokensStorage authTokensStorage(Ref ref) {
  return AuthTokensStorageImpl(SecureKeyValueStorage());
}

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
RestApiService restApiService(Ref ref) {
  final authTokensStorage = ref.read(authTokensStorageProvider);
  return DioApiService(
    baseUrl: 'https://api.example.com',
    getAuthToken: () async {
      return await authTokensStorage.getAuthToken() ?? '';
    },
    refreshAuthToken: () async {
      final refreshToken = await authTokensStorage.getRefreshToken();
      if (refreshToken == null) {
        return false;
      }
      // For now, return false - this will be implemented with the auth API
      return false;
    },
  );
}
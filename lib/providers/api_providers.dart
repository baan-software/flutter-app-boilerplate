import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_boilerplate/providers/services_providers.dart';
import 'package:flutter_boilerplate/api/auth/auth_api.dart';
import 'package:flutter_boilerplate/api/auth/auth_api_impl.dart';

part 'api_providers.g.dart';

@riverpod
AuthApi authApi(Ref ref) {
  final restApiService = ref.read(restApiServiceProvider);
  return AuthApiImpl(restApiService: restApiService);
} 
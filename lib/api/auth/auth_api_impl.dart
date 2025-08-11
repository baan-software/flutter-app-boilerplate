import 'package:flutter_boilerplate/api/auth/auth_api.dart';
import 'package:flutter_boilerplate/api/auth/response/login_response.dart';
import 'package:flutter_boilerplate/api/auth/response/logout_response.dart';
import 'package:flutter_boilerplate/api/auth/response/refresh_token_response.dart';
import 'package:flutter_boilerplate/api/auth/response/user_response.dart';
import 'package:flutter_boilerplate/services/rest_api/request.dart';
import 'package:flutter_boilerplate/services/rest_api/rest_api_service.dart';


class AuthApiImpl implements AuthApi {
  final RestApiService restApiService;

  AuthApiImpl({
    required this.restApiService,
  });

  @override
  Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    final response = await restApiService.post(
      Request(
        url: '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      ),
    );

    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LogoutResponse> logout() async {
    final response = await restApiService.post(
      Request(
        url: '/auth/logout',
      ),
    );
    return LogoutResponse.fromJson(response.data);
  }

  @override
  Future<UserResponse> getCurrentUser() async {
    final response = await restApiService.get(
      Request(
        url: '/user',
      ),
    );
    return UserResponse.fromJson(response.data);
  }

  @override
  Future<RefreshTokenResponse> getRefreshToken(
    String refreshToken,
  ) async {
    final response = await restApiService.post(
      Request(
        url: '/auth/refresh',
        headers: {
          'Authorization': 'Bearer $refreshToken',
          'is-refresh-token-request': 'true',
        },
      ),
    );
    return RefreshTokenResponse.fromJson(response.data);
  }
} 
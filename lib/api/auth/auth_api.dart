import 'package:flutter_boilerplate/api/auth/response/login_response.dart';
import 'package:flutter_boilerplate/api/auth/response/logout_response.dart';
import 'package:flutter_boilerplate/api/auth/response/user_response.dart';
import 'package:flutter_boilerplate/api/auth/response/refresh_token_response.dart';

abstract class AuthApi {
  Future<LoginResponse> login(String email, String password);
  Future<LogoutResponse> logout();
  Future<UserResponse> getCurrentUser();
  Future<RefreshTokenResponse> getRefreshToken(String refreshToken);
} 
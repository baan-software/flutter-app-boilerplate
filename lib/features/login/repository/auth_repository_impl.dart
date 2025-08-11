import '../../../shared/models/user_model.dart';
import 'auth_repository.dart';
import 'package:flutter_boilerplate/api/auth/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<bool> login(String email, String password) async {
    try {
      await _authApi.login(email, password);
      return true;
    } catch (e) {
      throw Exception('Repository sign in failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _authApi.logout();
    } catch (e) {
      throw Exception('Repository sign out failed: $e');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _authApi.getCurrentUser();
      return UserModel(
        id: response.id,
        email: response.email,
        name: response.name,
      );
    } catch (e) {
      throw Exception('Repository get current user failed: $e');
    }
  }
} 
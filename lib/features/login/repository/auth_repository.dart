import 'package:flutter_boilerplate/shared/models/user_model.dart';

/// Repository for authentication operations
abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
} 
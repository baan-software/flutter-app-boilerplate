import 'package:flutter_boilerplate/services/storage/auth_tokens_storage.dart';
import 'package:flutter_boilerplate/services/storage/secure_key_value_storage.dart';

class AuthTokensStorageImpl implements AuthTokensStorage {
  final SecureKeyValueStorage _storage;
  static const String _authTokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';

  AuthTokensStorageImpl(this._storage);

  @override
  Future<String?> getAuthToken() async {
    return await _storage.getString(_authTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.getString(_refreshTokenKey);
  }

  @override
  Future<void> setAuthToken(String token) async {
    await _storage.setString(_authTokenKey, token);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    await _storage.setString(_refreshTokenKey, token);
  }

  @override
  Future<void> clearTokens() async {
    await _storage.remove(_authTokenKey);
    await _storage.remove(_refreshTokenKey);
  }
} 
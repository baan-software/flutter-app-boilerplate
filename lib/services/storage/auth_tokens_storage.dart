abstract class AuthTokensStorage {
  Future<String?> getAuthToken();
  Future<String?> getRefreshToken();
  Future<void> setAuthToken(String token);
  Future<void> setRefreshToken(String token);
  Future<void> clearTokens();
} 
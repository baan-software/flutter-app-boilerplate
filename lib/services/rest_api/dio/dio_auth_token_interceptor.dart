
import 'package:dio/dio.dart';

class DioAuthTokenInterceptor extends InterceptorsWrapper {

  final retries = 1;
  final Dio client;
  final Future<String> Function() getAuthToken;
  final Future<bool> Function() refreshAuthToken;

  DioAuthTokenInterceptor(this.client, this.getAuthToken, this.refreshAuthToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      final authToken = options.headers['Bearer'] ?? (await getAuthToken());
      options._isRefreshTokenRequest = options.headers["is-refresh-token-request"] == 'true';
      options.headers["Authorization"] = "Bearer $authToken";
      super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async { 
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (err.requestOptions._isRefreshTokenRequest) {
      return handler.next(err);
    }

    final attempt = err.requestOptions._retryAttempt + 1;
    if (attempt > retries) {
      handler.next(err);
      return;
    }
    
    if (await refreshAuthToken()) {
      try {
        final response = await _retry(err.requestOptions);
        return handler.resolve(response);
      } on DioException catch (error) {
        return handler.next(error);
      }
    }
    
    return handler.next(err);
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    requestOptions._retryAttempt = requestOptions._retryAttempt + 1;
    return client.fetch(requestOptions);
  }
}

extension RetryOptions on RequestOptions {
  int get _retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set _retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
  bool get _isRefreshTokenRequest => (extra['is_refresh_token_request'] as bool?) ?? false;
  set _isRefreshTokenRequest(bool isRefresh) => extra['is_refresh_token_request'] = isRefresh;
}
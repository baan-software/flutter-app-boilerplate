

class Request {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? data;
  final Map<String, String>? headers;

  Request({
    required this.url, 
    this.queryParameters, 
    this.data,
    this.headers
  });
}
import 'package:bytebank2/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class WebClient {
  WebClient() {
    client = HttpClientWithInterceptor.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: Duration(seconds: 5),
    );
    host = '192.168.0.106:8080';
  }

  Client client;

  String host;
}

import 'dart:convert';

import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.toString());
    return data;
  }
}

class WebClient {
  static Client _client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);

  static Uri _uri = new Uri.http(
    '192.168.0.106:8080',
    'transactions',
  );

  Future<List<Transaction>> findAll() async {
    final Response response = await _client.get(_uri).timeout(
          Duration(seconds: 5),
        );
    final List<Transaction> transactions = [];
    if (response.statusCode == 200) {
      final List<dynamic> transactionJson = jsonDecode(response.body);
      transactionJson.forEach((element) {
        final Map<String, dynamic> contactJson = element['contact'];
        transactions.add(Transaction(
          element['value'],
          Contact(
            0,
            contactJson['name'],
            contactJson['accountNumber'],
          ),
        ));
      });
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final Response response = await _client
        .post(
          _uri,
          headers: {
            "Content-Type": "application/json",
            "password": "1000",
          },
          body: jsonEncode(transaction.getMap()),
        )
        .timeout(
          Duration(seconds: 5),
        );
    final Map<String, dynamic> responseJson = jsonDecode(response.body);
    Transaction transactionResponse = Transaction(
      responseJson['value'],
      Contact(
        0,
        responseJson['name'],
        responseJson['accountNumber'],
      ),
    );
    return transactionResponse;
  }
}

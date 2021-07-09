import 'dart:convert';

import 'package:bytebank2/http/webclient.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient extends WebClient {
  Uri _uri;

  TransactionWebClient({String path: 'transactions'}) : super() {
    _uri = Uri.http(this.host, path);
  }

  Future<List<Transaction>> findAll() async {
    final Response response = await this.client.get(_uri).timeout(
          Duration(seconds: 5),
        );
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic element) => Transaction.fromJson(element))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final Response response = await this
        .client
        .post(
          _uri,
          headers: {
            "Content-Type": "application/json",
            "password": password,
          },
          body: jsonEncode(transaction.toJson()),
        )
        .timeout(
          Duration(seconds: 5),
        );
    return Transaction.fromJson(jsonDecode(response.body));
  }
}

import 'package:bytebank2/components/centered_message.dart';
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/http/webclients/transaction_webclient.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:bytebank2/screens/transfers/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.findAll(),
        // Future.delayed(Duration(seconds: 2))
        //     .then((value) => WebClient().findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data.isNotEmpty) {
                  return TransactionItem(transactions: snapshot.data);
                }
              }
              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );

              break;
          }
          return CenteredMessage('Unkown error');
        },
      ),
    );
  }
}

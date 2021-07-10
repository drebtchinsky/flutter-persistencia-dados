import 'package:bytebank2/components/feature_item.dart';
import 'package:bytebank2/screens/contacts/contacts_list.dart';
import 'package:bytebank2/screens/transfers/transactions_list.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String _textButtonTransfer = 'Transfer';
  final String _textButtonTransactionFeed = 'Transaction Feed';
  final String _appBarTitle = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FeatureItem(
                    _textButtonTransfer,
                    Icons.monetization_on,
                    onClick: () {
                      _showContatctsList(context);
                    },
                  ),
                  FeatureItem(
                    _textButtonTransactionFeed,
                    Icons.description,
                    onClick: () => _showTransactionsList(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContatctsList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ContactsList(),
    ));
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ));
  }
}

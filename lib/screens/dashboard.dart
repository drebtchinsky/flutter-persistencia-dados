import 'package:bytebank2/components/navigation_item.dart';
import 'package:bytebank2/screens/contacts/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String _textButtonContacts = 'Contacts';
  final String _textButtonTransfer = 'Transfer';
  final String _textButtonTransactionFeed = 'Transaction Feed';
  final String _appBarTitle = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            SizedBox(
              height: 100.0,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  NavigationItem(
                    textButton: _textButtonContacts,
                    screen: ContactsList(),
                    icon: Icons.people,
                  ),
                  NavigationItem(
                    textButton: _textButtonTransfer,
                    screen: ContactsList(),
                    icon: Icons.monetization_on,
                  ),
                  NavigationItem(
                    textButton: _textButtonTransactionFeed,
                    screen: ContactsList(),
                    icon: Icons.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bytebank2/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String _textButtonContacts = 'Contacts';
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactsList(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 48.0,
                      ),
                      Text(
                        _textButtonContacts,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

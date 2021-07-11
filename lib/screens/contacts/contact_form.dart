import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final ContactDao contactDao;

  const ContactForm({Key key, @required this.contactDao}) : super(key: key);
  @override
  _ContactFormState createState() => _ContactFormState(contactDao);
}

class _ContactFormState extends State<ContactForm> {
  final String _appBarTitle = 'New Contact';

  final String _textButton = 'Create';

  final String _labelTextName = 'Full Name';

  final String _labelTextAccount = 'Account Number';

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountController = TextEditingController();

  final ContactDao contactDao;

  _ContactFormState(this.contactDao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: _labelTextName,
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(
                  labelText: _labelTextAccount,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(_textButton),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int account = int.tryParse(_accountController.text);

                    final Contact newContact = Contact(0, name, account);

                    _save(newContact, context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(Contact newContact, BuildContext context) async {
    await contactDao.save(newContact);
    Navigator.pop(context, newContact);
  }
}

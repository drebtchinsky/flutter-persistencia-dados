import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contacts/contact_form.dart';
import 'package:bytebank2/screens/transfers/transaction_form.dart';
import 'package:bytebank2/widgets/app_dependences.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final String _appBarTitle = 'Contacts';

  @override
  Widget build(BuildContext context) {
    final dependences = AppDependences.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
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
              final List<Contact> contacts = snapshot.data;

              return _ContactListBuilder(contacts: contacts);
              break;
          }
          return Text('Unknown error');
        },
        future: dependences.contactDao.findAll(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm(),
              ))
              .then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactListBuilder extends StatelessWidget {
  const _ContactListBuilder({
    Key key,
    @required this.contacts,
  }) : super(key: key);

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Contact contact = contacts[index];
        return ContactItem(contact, onClick: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionForm(contact),
          ));
        });
      },
      itemCount: contacts.length,
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  ContactItem(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

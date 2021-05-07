import 'package:bytebank2/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

  Map<String, dynamic> getMap() {
    return {
      'value': value,
      'contact': {
        'name': contact.name,
        'accountNumber': contact.accountNumber,
      },
    };
  }
}

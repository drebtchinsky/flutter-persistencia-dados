import 'package:bytebank2/models/contact.dart';

class Transaction {
  final String id;
  final double value;
  final Contact contact;

  Transaction(
    this.id,
    this.value,
    this.contact,
  ) : assert(value > 0);

  @override
  String toString() {
    return 'Transaction{id: $id, value: $value, contact: $contact}';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
      };

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);
}

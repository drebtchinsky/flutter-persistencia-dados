import 'package:flutter/material.dart';

class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Contact{name:$name, accountNumber:$accountNumber}';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'accountNumber': accountNumber,
      };

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  @override
  bool operator ==(Object outher) =>
      identical(this, outher) ||
      outher is Contact &&
          runtimeType == outher.runtimeType &&
          name == outher.name &&
          accountNumber == outher.accountNumber;

  @override
  int get hashCode => name.hashCode ^ accountNumber.hashCode;
}

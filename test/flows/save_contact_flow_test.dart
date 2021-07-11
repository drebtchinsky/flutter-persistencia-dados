import 'package:bytebank2/main.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contacts/contact_form.dart';
import 'package:bytebank2/screens/contacts/contacts_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matchers.dart';
import 'mocks.dart';

void main() {
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(Bytebank2App(
      contactDao: mockContactDao,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate(
        (Widget widget) => findFeatureItem(widget, name: 'Transfer'));
    expect(transferFeatureItem, findsOneWidget);

    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);
    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactsForm = find.byType(ContactForm);
    expect(contactsForm, findsOneWidget);

    final nameTextField = find.byWidgetPredicate(
      (widget) => textFieldMatcher(widget, 'Full Name'),
    );
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Teste');

    final accountNumberTextField = find.byWidgetPredicate(
      (widget) => textFieldMatcher(widget, 'Account Number'),
    );
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(accountNumberTextField, '1000');

    final createButton = find.widgetWithText(ElevatedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    verify(mockContactDao.save(Contact(0, 'Teste', 1000))).called(1);

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);
    verify(mockContactDao.findAll()).called(1);
  });
}

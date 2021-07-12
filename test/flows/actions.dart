import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';

Future<void> clickOnTransferFeatureItem(WidgetTester tester) async {
  final transferFeatureItem = find.byWidgetPredicate(
      (Widget widget) => findFeatureItem(widget, name: 'Transfer'));
  expect(transferFeatureItem, findsOneWidget);
  return tester.tap(transferFeatureItem);
}

import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';
import '../mock/mocks.dart';

void main() {
  testWidgets('Should display the main image when the Dashboard is opened',
      (WidgetTester tester) async {
    await _pumpDashboardWidget(tester);
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets(
      'Should display the transfer feature when the Dashboard is opened',
      (tester) async {
    await _pumpDashboardWidget(tester);

    final featureItem = find.byWidgetPredicate((Widget widget) =>
        findFeatureItem(widget, icon: Icons.monetization_on, name: 'Transfer'));
    expect(featureItem, findsOneWidget);
  });

  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
      (tester) async {
    await _pumpDashboardWidget(tester);

    final featureItem = find.byWidgetPredicate((Widget widget) =>
        findFeatureItem(widget,
            icon: Icons.description, name: 'Transaction Feed'));
    expect(featureItem, findsOneWidget);
  });
}

Future<void> _pumpDashboardWidget(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Dashboard(),
  ));
}

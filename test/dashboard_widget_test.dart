import 'package:bytebank2/components/feature_item.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

    final featureItem = _findFeatureItem(Icons.monetization_on, 'Transfer');
    expect(featureItem, findsOneWidget);
  });

  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
      (tester) async {
    await _pumpDashboardWidget(tester);

    final featureItem = _findFeatureItem(Icons.description, 'Transaction Feed');
    expect(featureItem, findsOneWidget);
  });
}

Finder _findFeatureItem(IconData icon, String name) {
  final featureItem = find.byWidgetPredicate((Widget widget) {
    if (widget is FeatureItem) {
      return widget.name == name && widget.icon == icon;
    }
    return false;
  });
  return featureItem;
}

Future<void> _pumpDashboardWidget(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Dashboard(),
  ));
}

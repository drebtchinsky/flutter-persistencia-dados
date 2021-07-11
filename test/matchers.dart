import 'package:bytebank2/components/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

bool findFeatureItem(Widget widget, {IconData icon, @required String name}) {
  if (widget is FeatureItem) {
    if (icon != null) {
      return widget.name == name && widget.icon == icon;
    }
    return widget.name == name;
  }
  return false;
}

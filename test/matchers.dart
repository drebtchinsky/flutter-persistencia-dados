import 'package:bytebank2/components/feature_item.dart';
import 'package:flutter/material.dart';

bool findFeatureItem(Widget widget, {IconData icon, @required String name}) {
  if (widget is FeatureItem) {
    if (icon != null) {
      return widget.name == name && widget.icon == icon;
    }
    return widget.name == name;
  }
  return false;
}

bool textFieldMatcher(Widget widget, String labelText) {
  if (widget is TextField) {
    return widget.decoration.labelText == labelText;
  }
  return false;
}

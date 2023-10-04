import 'package:flutter/material.dart';

extension ColorsExt on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

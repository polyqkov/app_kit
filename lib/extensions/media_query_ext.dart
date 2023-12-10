import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

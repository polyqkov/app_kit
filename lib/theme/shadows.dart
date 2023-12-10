import 'package:flutter/material.dart';

class Shadows {
  BoxShadow buttonShadow(Color color) {
    return BoxShadow(
      color: color.withOpacity(0.4),
      blurRadius: 10,
      offset: const Offset(0.0, 0.0),
    );
  }
}

import 'package:flutter/material.dart';

import '../extensions/colors_ext.dart';
import 'themes.dart';

class Shadows {
  static BoxShadow getButtonShadow(BuildContext context) {
    return BoxShadow(
      color: context.colors.primaryBrandColor.withOpacity(0.4),
      blurRadius: 10,
    );
  }
}

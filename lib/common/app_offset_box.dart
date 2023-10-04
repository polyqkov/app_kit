import 'package:flutter/material.dart';

import 'sizes.dart';

class AppOffsetBox {
  // Custom
  SizedBox custom({required double height, required double width}) => SizedBox(
        height: height,
        width: width,
      );

  // Horizontal
  /// Height: 1
  SizedBox get verticalLine => const SizedBox(height: 1);

  /// Height: 4.5
  SizedBox get vertical1x => SizedBox(height: AppSizes().size1x);

  /// Height: 9
  SizedBox get vertical2x => SizedBox(height: AppSizes().size2x);

  /// Height: 13.5
  SizedBox get vertical3x => SizedBox(height: AppSizes().size3x);

  /// Height: 18
  SizedBox get vertical4x => SizedBox(height: AppSizes().size4x);

  /// Height: 22.5
  SizedBox get vertical5x => SizedBox(height: AppSizes().size5x);

  /// Height: 27
  SizedBox get vertical6x => SizedBox(height: AppSizes().size6x);

  /// Height: 36
  SizedBox get vertical8x => SizedBox(height: AppSizes().size8x);

  /// Height: 54
  SizedBox get vertical12x => SizedBox(height: AppSizes().size12x);

  /// Height: 72
  SizedBox get vertical16x => SizedBox(height: AppSizes().size16x);

  // Vertical
  /// Width: 1
  SizedBox get horizontalLine => const SizedBox(width: 1);

  /// Width: 4.5
  SizedBox get horizontal1x => SizedBox(width: AppSizes().size1x);

  /// Width: 9
  SizedBox get horizontal2x => SizedBox(width: AppSizes().size2x);

  /// Width: 13.5
  SizedBox get horizontal3x => SizedBox(width: AppSizes().size3x);

  /// Width: 18
  SizedBox get horizontal4x => SizedBox(width: AppSizes().size4x);

  /// Width: 22.5
  SizedBox get horizontal5x => SizedBox(width: AppSizes().size5x);

  /// Width: 27
  SizedBox get horizontal6x => SizedBox(width: AppSizes().size6x);

  /// Width: 36
  SizedBox get horizontal8x => SizedBox(width: AppSizes().size8x);

  /// Width: 54
  SizedBox get horizontal12x => SizedBox(width: AppSizes().size12x);

  /// Width: 72
  SizedBox get horizontal16x => SizedBox(width: AppSizes().size16x);
}

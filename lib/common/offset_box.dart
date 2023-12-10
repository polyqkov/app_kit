import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'sizes.dart';

class OffsetBox {
  // Custom
  Gap custom({required double size}) => Gap(size);

  /// Empty Box
  SizedBox empty = const SizedBox.shrink();

  /// Height: 1
  Gap get line => const Gap(1);

  /// Height: 4.5
  Gap get offset1x => Gap(AppSizes().size1x);

  /// Height: 9
  Gap get offset2x => Gap(AppSizes().size2x);

  /// Height: 13.5
  Gap get offset3x => Gap(AppSizes().size3x);

  /// Height: 18
  Gap get offset4x => Gap(AppSizes().size4x);

  /// Height: 22.5
  Gap get offset5x => Gap(AppSizes().size5x);

  /// Height: 27
  Gap get offset6x => Gap(AppSizes().size6x);

  /// Height: 36
  Gap get offset8x => Gap(AppSizes().size8x);

  /// Height: 54
  Gap get offset12x => Gap(AppSizes().size12x);

  /// Height: 72
  Gap get offset16x => Gap(AppSizes().size16x);
}

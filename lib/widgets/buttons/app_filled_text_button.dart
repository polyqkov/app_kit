import 'package:flutter/widgets.dart';

import '../../../extensions/colors_ext.dart';
import '../../../extensions/sizes_ext.dart';
import '../../../extensions/text_styles_ext.dart';
import '../../../theme/themes.dart';
import '../../animations/circle_loading.dart';
import '../../animations/tap_animation.dart';
import '../base/app_container.dart';
import '../base/app_text.dart';

class AppFilledTextButton extends StatelessWidget {
  const AppFilledTextButton({
    super.key,
    required this.title,
    this.onTap,
    this.height,
    this.width,
    this.isEnabled = true,
    this.backgroundColor,
    this.titleColor,
    this.isFitted = false,
    this.translateTitle = true,
    this.shadows,
    this.isLoading = false,
  });

  final String title;
  final double? height;
  final double? width;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool isFitted;
  final bool translateTitle;
  final bool isLoading;
  final void Function()? onTap;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return TapAnimation(
      onTap: !isLoading
          ? isEnabled
              ? onTap
              : null
          : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: AppContainer(
          key: ValueKey(isEnabled),
          isFitted: isFitted,
          height: height,
          width: width,
          color: isEnabled
              ? backgroundColor ?? context.colors.primary
              : (backgroundColor ?? context.colors.primary).withOpacity(0.25),
          borderRadius: BorderRadius.circular(context.sizes.size4x),
          shadows: isEnabled ? shadows : [],
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sizes.size4x,
              vertical: context.sizes.size3x,
            ),
            child: Center(
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.5),
                      child: CircleLoading(
                        size: 18,
                        color: context.colors.onPrimaryBrandColor,
                      ),
                    )
                  : AppText(
                      title,
                      isTranslate: translateTitle,
                      style: context.textStyles.calloutSemiBold.copyWith(
                        color: isEnabled
                            ? titleColor ?? context.colors.onPrimary
                            : (titleColor ?? context.colors.onPrimary)
                                .withOpacity(0.25),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

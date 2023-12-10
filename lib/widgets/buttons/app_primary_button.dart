import 'package:app_kit/extensions/shadows_ext.dart';
import 'package:flutter/widgets.dart';

import '../../../extensions/colors_ext.dart';
import '../../../extensions/sizes_ext.dart';
import '../../../extensions/text_styles_ext.dart';
import '../../../theme/themes.dart';
import '../../animations/circle_loading.dart';
import '../../animations/tap_animation.dart';
import '../base/app_container.dart';
import '../base/app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.height,
    this.width,
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
  final Color? backgroundColor;
  final Color? titleColor;
  final bool isFitted;
  final bool translateTitle;
  final bool isLoading;
  final List<BoxShadow>? shadows;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color backgroundColorLocal =
        backgroundColor ?? context.colors.primaryBrandColor;
    Color titleColorLocal = titleColor ?? context.colors.onPrimaryBrandColor;

    return TapAnimation(
      onTap: isLoading ? null : onTap,
      child: AppContainer(
        isFitted: isFitted,
        height: height,
        width: width,
        color: backgroundColorLocal,
        borderRadius: BorderRadius.circular(context.sizes.size4x),
        shadows: [context.shadows.buttonShadow(backgroundColorLocal)],
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizes.size5x,
            vertical: context.sizes.size3x,
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.5),
                      child: CircleLoading(
                        size: 18,
                        color: titleColorLocal,
                      ),
                    )
                  : AppText(
                      title,
                      isTranslate: translateTitle,
                      style: context.textStyles.calloutSemiBold
                          .copyWith(color: titleColorLocal),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

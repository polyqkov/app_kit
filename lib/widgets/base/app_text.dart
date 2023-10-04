import 'package:flutter/widgets.dart';

enum AppTextCase {
  upperCase,
  lowerCase,
  defaultCase,
}

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textCase = AppTextCase.defaultCase,
    this.isTranslate = true,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isTranslate;
  final AppTextCase textCase;

  @override
  Widget build(BuildContext context) {
    String finalText = isTranslate ? text : text;
    if (textCase == AppTextCase.upperCase) {
      finalText = finalText.toUpperCase();
    } else if (textCase == AppTextCase.lowerCase) {
      finalText = finalText.toLowerCase();
    }
    return Text(
      finalText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

import 'package:flutter/widgets.dart';

import '../../extensions/colors_ext.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius borderRadius;
  final List<BoxShadow>? shadows;
  final BoxShape shape;
  final bool isFitted;
  final bool? isFilled;

  const AppContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.color,
    this.shadows,
    this.borderRadius = BorderRadius.zero,
    this.shape = BoxShape.rectangle,
    this.isFitted = false,
    this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    if (width != null || height != null) {
      current = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: current,
      );
    } else {
      if (child == null) {
        current = LimitedBox(
          maxWidth: 0.0,
          maxHeight: 0.0,
          child: ConstrainedBox(constraints: const BoxConstraints.expand()),
        );
      } else {
        current = isFitted ? FittedBox(child: current) : current;
      }
    }

    return shape == BoxShape.circle
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color ?? context.colors.primary,
              shape: BoxShape.circle,
              boxShadow: shadows,
            ),
            child: current,
          )
        : CustomPaint(
            painter: _AppContainerPainter(
              borderRadius: borderRadius,
              color: color ?? context.colors.primary,
              shadows: shadows,
              isFilled: isFilled,
            ),
            child: current,
          );
  }
}

class _AppContainerPainter extends CustomPainter {
  final Color color;
  final BorderRadius borderRadius;
  final List<BoxShadow>? shadows;
  final bool? isFilled;

  const _AppContainerPainter({
    required this.color,
    required this.borderRadius,
    required this.shadows,
    this.isFilled,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = isFilled == false ? PaintingStyle.stroke : PaintingStyle.fill
      ..strokeWidth = isFilled == false ? 2 : 0;

    final path = Path()
      ..moveTo(borderRadius.topLeft.x, 0)
      ..cubicTo(
        borderRadius.topLeft.x * 0.4488,
        0,
        0,
        borderRadius.topLeft.y * 0.4488,
        0,
        borderRadius.topLeft.y,
      )
      ..lineTo(0, size.height - borderRadius.bottomLeft.y)
      ..cubicTo(
        0,
        size.height - borderRadius.bottomLeft.y * 0.4488,
        borderRadius.bottomLeft.x * 0.4488,
        size.height,
        borderRadius.bottomLeft.x,
        size.height,
      )
      ..lineTo(size.width - borderRadius.bottomRight.x, size.height)
      ..cubicTo(
        size.width - borderRadius.bottomRight.x * 0.4488,
        size.height,
        size.width,
        size.height - borderRadius.bottomRight.y * 0.4488,
        size.width,
        size.height - borderRadius.bottomRight.y,
      )
      ..lineTo(size.width, borderRadius.topRight.y)
      ..cubicTo(
        size.width,
        borderRadius.topRight.y * 0.4488,
        size.width - borderRadius.topRight.x * 0.4488,
        0,
        size.width - borderRadius.topRight.x,
        0,
      )
      ..close();

    if (shadows?.isNotEmpty == true) {
      for (var shadow in shadows!) {
        canvas.drawShadow(path, shadow.color, shadow.blurRadius, false);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

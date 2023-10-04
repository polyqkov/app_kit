import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:gaimon/gaimon.dart';

class ShakeAnimation extends StatefulWidget {
  const ShakeAnimation({
    Key? key,
    required this.child,
    this.shake = false,
  }) : super(key: key);

  final Widget child;
  final bool shake;

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  @override
  void didUpdateWidget(covariant ShakeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.shake != widget.shake) {
      if (widget.shake) {
        Gaimon.error();
        animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue = sin(6 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * 5, 0),
          child: child,
        );
      },
    );
  }
}

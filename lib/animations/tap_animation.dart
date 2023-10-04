import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum TapAnimationSemantic {
  button,
  textField,
  container,
}

class TapAnimation extends StatefulWidget {
  const TapAnimation({
    Key? key,
    required this.child,
    this.pressedScale = 0.97,
    this.enableFeedback = true,
    this.onTap,
    this.semantic = TapAnimationSemantic.button,
  }) : super(key: key);

  final Widget child;
  final double pressedScale;
  final bool enableFeedback;
  final void Function()? onTap;
  final TapAnimationSemantic semantic;

  @override
  State<TapAnimation> createState() => _TapAnimationState();
}

class _TapAnimationState extends State<TapAnimation>
    with SingleTickerProviderStateMixin {
  static const Duration kScaleDownDuration = Duration(milliseconds: 75);
  static const Duration kScaleUpDuration = Duration(milliseconds: 100);
  Tween<double>? _scaleTween;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleTween = Tween<double>(begin: 1.0, end: widget.pressedScale);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _scaleAnimation = _animationController
        .drive(CurveTween(curve: Curves.easeInOut))
        .drive(_scaleTween!);
    _updateTweenEnd();
  }

  @override
  void didUpdateWidget(TapAnimation old) {
    super.didUpdateWidget(old);
    _updateTweenEnd();
  }

  void _updateTweenEnd() {
    _scaleTween?.end = widget.pressedScale;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _widgetHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_widgetHeldDown) {
      _widgetHeldDown = true;
      if (widget.enableFeedback) {
        HapticFeedback.selectionClick();
      }
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_widgetHeldDown) {
      _widgetHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_widgetHeldDown) {
      _widgetHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating == true) return;
    final bool wasHeldDown = _widgetHeldDown;
    final TickerFuture ticker = _widgetHeldDown
        ? _animationController.animateTo(1.0, duration: kScaleDownDuration)
        : _animationController.animateTo(0.0, duration: kScaleUpDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _widgetHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onTap != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: enabled ? widget.onTap : null,
      child: Semantics(
        button: widget.semantic == TapAnimationSemantic.button,
        textField: widget.semantic == TapAnimationSemantic.textField,
        container: widget.semantic == TapAnimationSemantic.button,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}

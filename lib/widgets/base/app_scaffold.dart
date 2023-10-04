import 'package:flutter/material.dart';

import '../../animations/circle_loading.dart';
import '../../extensions/colors_ext.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.padding,
    this.isLoading = false,
    this.resizeToAvoidBottomInset,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final bool? resizeToAvoidBottomInset;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;

    if (widget.padding != null) {
      child = Padding(
        padding: widget.padding!,
        child: child,
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        appBar: AppBar(toolbarHeight: 0),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Stack(
            key: ValueKey(widget.isLoading),
            children: [
              child,
              widget.isLoading
                  ? Container(
                      decoration:
                          BoxDecoration(color: context.colors.background),
                      child: const Center(child: CircleLoading()),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

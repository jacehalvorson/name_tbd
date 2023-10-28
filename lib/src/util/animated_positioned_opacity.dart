import 'package:flutter/material.dart';

class AnimatedPositionedOpacity extends StatelessWidget {
  final double topValue;
  final double opacityValue;
  final Widget child;
  final Duration duration;

  const AnimatedPositionedOpacity({
    super.key,
    required this.topValue,
    required this.opacityValue,
    required this.duration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: topValue,
      // curve: Curves.easeInOut,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: duration,
        opacity: opacityValue,
        // curve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}

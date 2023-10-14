import 'package:flutter/material.dart';
import '../main_page/animated_positioned_opacity.dart';
import '../types.dart';

// How long a swipe animation takes
const swipeDuration = Duration(milliseconds: 250);

// How far above the top of the screen that hidden objects are placed
const offScreenAboveDistance = 300.0;
// The multiplier for the screen height to determine the on-screen position
const onScreenMultiplier = 0.28;
// How far below the bottom of the screen that hidden objects are placed
const offScreenBelowDistance = 0.0;

// Animated activity widget with icon/text that slides on/off the screen
class SlidingActivityWidget extends StatefulWidget {
  const SlidingActivityWidget(
      {super.key, required this.activity, required this.displayPosition});

  final ActivityType activity;
  final DisplayPosition displayPosition;

  @override
  State<SlidingActivityWidget> createState() => _SlidingActivityWidgetState();
}

class _SlidingActivityWidgetState extends State<SlidingActivityWidget> {
  @override
  Widget build(BuildContext context) {
    double bottomOfScreenPosition = MediaQuery.of(context).size.height;

    Map<DisplayPosition, double> topValues = {
      // Subtract the distance from the bottom of the screen to the top of the widget
      DisplayPosition.belowScreen:
          bottomOfScreenPosition - offScreenBelowDistance,
      // Use a fraction of the screen height to place the widget on the screen
      DisplayPosition.onScreen: bottomOfScreenPosition * onScreenMultiplier,
      // Negate distance to place above the top of the screen
      DisplayPosition.aboveScreen: offScreenAboveDistance * -1,
    };

    return AnimatedPositionedOpacity(
      // 400 ms animation for swiping
      duration: const Duration(milliseconds: 300),

      // Based on the swipe count, determine the top position of the widget
      // Use ! to assert that the value is not null
      topValue: topValues[widget.displayPosition]!,

      // When adjustedSwipeCount is 1, this widget is on the screen
      opacityValue:
          (widget.displayPosition == DisplayPosition.onScreen) ? 1 : 0,

      child: ActivityWidget(
        activity: widget.activity,
      ),
    );
  }
}

// Activity icon (emoji) and title
class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key, required this.activity});

  final ActivityType activity;

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          // Display the emoji as text because it is a string
          Text(
            activity.icon,
            style: const TextStyle(
              fontSize: 200,
            ),
          ),

          // Activity title
          Text(
            activity.title,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

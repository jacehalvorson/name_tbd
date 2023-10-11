import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/main_page/animated_positioned_opacity.dart';

// How long a swipe animation takes
const swipeDuration = Duration(milliseconds: 250);

// How far above the top of the screen that hidden objects are placed
const offScreenAboveDistance = 300.0;
// The multiplier for the screen height to determine the on-screen position
const onScreenMultiplier = 0.28;
// How far below the bottom of the screen that hidden objects are placed
const offScreenBelowDistance = 0.0;

class ActivityType {
  int id;
  String title;
  String icon;

  ActivityType({required this.id, required this.title, required this.icon});
}

// Animated activity widget with icon/text that slides on/off the screen
class SlidingActivityWidget extends StatefulWidget {
  const SlidingActivityWidget(
      {super.key, required this.activity, required this.swipeCount});

  final ActivityType activity;
  final int swipeCount;

  @override
  State<SlidingActivityWidget> createState() => _SlidingActivityWidgetState();
}

class _SlidingActivityWidgetState extends State<SlidingActivityWidget> {
  @override
  Widget build(BuildContext context) {
    double bottomOfScreenPosition = MediaQuery.of(context).size.height;

    // Give the widget a position (0, 1, or 2)
    int adjustedSwipeCount = widget.swipeCount % 3;

    Map<int, double> topValues = {
      // Subtract the distance from the bottom of the screen to the top of the widget
      0: bottomOfScreenPosition - offScreenBelowDistance,
      // Use a fraction of the screen height to place the widget on the screen
      1: bottomOfScreenPosition * onScreenMultiplier,
      // Negate distance to place above the top of the screen
      2: offScreenAboveDistance * -1,
    };

    return AnimatedPositionedOpacity(
      // 400 ms animation for swiping
      duration: const Duration(milliseconds: 300),

      // Based on the swipe count, determine the top position of the widget
      // Use ! to assert that the value is not null
      topValue: topValues[adjustedSwipeCount]!,

      // When adjustedSwipeCount is 1, this widget is on the screen
      opacityValue: (adjustedSwipeCount == 1) ? 1 : 0,

      child: ActivityWidget(
        activity: widget.activity,
      ),
    );
  }
}

// Activity icon (emoji)
class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key, required this.activity});

  final ActivityType activity;

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    Brightness brightness = Theme.of(context).brightness;
    Color textColor = ThemeColor.getColor(ColorType.text, brightness);

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
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

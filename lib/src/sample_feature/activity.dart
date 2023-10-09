import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/sample_feature/animated_positioned_opacity.dart';

const swipeDuration = Duration(milliseconds: 350);

class ActivityType {
  // Activity icon
  int id;
  // Activity name
  String title;
  // Activity icon
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
    int adjustedSwipeCount = widget.swipeCount % 3;
    Map<int, double> topValues = {
      0: MediaQuery.of(context).size.height,
      1: MediaQuery.of(context).size.height * 0.3,
      2: -300,
    };

    return AnimatedPositionedOpacity(
      // 400 ms animation for swiping
      duration: const Duration(milliseconds: 300),

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

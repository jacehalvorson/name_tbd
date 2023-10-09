import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';

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
      0: -300,
      1: MediaQuery.of(context).size.height * 0.3,
      2: MediaQuery.of(context).size.height,
    };

    return AnimatedPositioned(
      // 400 ms animation from on-screen to off-screen
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,

      // If the activity title is 'Running', animate the widget off the
      // screen. Otherwise, animate the widget on the screen.
      top: topValues[adjustedSwipeCount],

      // Center horizontally
      left: 0,
      right: 0,

      // Activity icon and name in the middle of the screen
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

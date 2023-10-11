import 'package:flutter/material.dart';
import 'package:refresh/src/activities_page/activities.dart';
import 'package:refresh/src/main_page/acceptance.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/main_page/activity.dart';
import 'package:refresh/src/settings/settings_view.dart';

const iconSize = 40.0;
const iconPaddingTop = 18.0;
const iconPaddingRight = 0.0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  // Default value, this is what will be first displayed to the user.
  int swipeCount = 0;
  DateTime? lastPressTime;

  // Callback function passed to the AcceptanceButton
  void acceptanceCallback() {
    // Set the activity title to the randomly generated string
    setState(() {
      // Only increment swipe count if there hasn't been a button press
      // or if the last button press was more than swipeDuration (300 ms) ago
      if (lastPressTime == null ||
          DateTime.now().difference(lastPressTime!) > swipeDuration) {
        swipeCount++;
        lastPressTime = DateTime.now();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    Brightness brightness = Theme.of(context).brightness;
    Color backgroundColor =
        ThemeColor.getColor(ColorType.background, brightness);
    Color primaryColor = ThemeColor.getColor(ColorType.primary, brightness);
    Color textColor = ThemeColor.getColor(ColorType.text, brightness);

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(top: iconPaddingTop, right: iconPaddingRight),
        child: Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, ActivitiesPage.routeName);
            },
            child: const Icon(Icons.hiking),
          ),
        ),
      ),
      body: Stack(
        children: [
          // If we add some backgound (image, gradient, pattern, etc.)
          // this is where to put it.
          // For example:
          // BackgroundElement(),

          // Animate the ActivityWidget on and off the screen
          SlidingActivityWidget(
            activity: ActivityType(
              id: 1,
              title: 'Running',
              icon: '🏃',
            ),
            swipeCount: swipeCount + 1,
          ),
          SlidingActivityWidget(
            activity: ActivityType(
              id: 2,
              title: 'Snowboarding',
              icon: '🏂',
            ),
            swipeCount: swipeCount,
          ),
          SlidingActivityWidget(
            activity: ActivityType(
              id: 3,
              title: 'Basketball',
              icon: '🏀',
            ),
            swipeCount: swipeCount + 2,
          ),

          // Layout for the 'How about...' text and 'Let's run it' button
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 'How about...' text at the top
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'How about...',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: textColor,
                    ),
                  ),
                ),
              ),

              // 'Let's run it' button at the bottom
              AcceptanceButton(onPressed: acceptanceCallback)
            ],
          ),
        ],
      ),
    );
  }
}

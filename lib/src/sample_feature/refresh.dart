import 'dart:math';
import 'package:flutter/material.dart';
import 'package:refresh/src/sample_feature/acceptance.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/sample_feature/activity.dart';
import 'package:refresh/src/settings/settings_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  // Default value, this is what will be first displayed to the user.
  String activityTitle = 'Running';
  int swipeCount = 0;

  // Sample callback function to be passed into the AcceptanceButton
  void acceptanceCallback() {
    // Randomly generate a string [a-z][A-Z][0-9] with a length of 8
    String randomString = List.generate(8, (index) {
      // Randomly generate a number between 0 and 61
      int random = Random().nextInt(62);

      // If the number is less than 10, return a number
      if (random < 10) {
        return String.fromCharCode(random + 48);
      }

      // If the number is less than 36, return an uppercase letter
      if (random < 36) {
        return String.fromCharCode(random + 55);
      }

      // If the number is less than 62, return a lowercase letter
      return String.fromCharCode(random + 61);
    }).join();

    // Set the activity title to the randomly generated string
    setState(() {
      activityTitle = randomString;
      swipeCount++;
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
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
              title: activityTitle,
              icon: '🏃',
            ),
            swipeCount: swipeCount + 1,
          ),
          SlidingActivityWidget(
            activity: ActivityType(
              id: 1,
              title: activityTitle,
              icon: '🏂',
            ),
            swipeCount: swipeCount,
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

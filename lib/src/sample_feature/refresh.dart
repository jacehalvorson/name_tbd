import 'dart:math';
import 'package:flutter/material.dart';
import 'package:refresh/src/sample_feature/acceptance.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/sample_feature/activity.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/sample_item';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  // Default value so this variable is not null when the widget first builds.
  String activityTitle = 'Running';

  void AcceptanceCallback() {
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

    // Set the icon color to the randomly generated color
    setState(() {
      activityTitle = randomString;
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
        title: const Text('Main Page'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
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

            // Activity icon and name in the middle
            ActivityWidget(
              activity: ActivityType(
                id: 1,
                title: activityTitle,
                icon: '🏃',
              ),
            ),

            // 'Let's run it' button at the bottom
            AcceptanceButton(onPressed: AcceptanceCallback)
          ],
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/sample_item';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  // Default value so this variable is not null when the widget first builds.
  Color _iconColor = const Color(0xFFFFFFFF);
  bool _buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    Brightness brightness = Theme.of(context).brightness;
    Color backgroundColor =
        ThemeColor.getColor(ColorType.background, brightness);
    Color primaryColor = ThemeColor.getColor(ColorType.primary, brightness);
    Color textColor = ThemeColor.getColor(ColorType.text, brightness);

    // Initially, set the icon color to the text color
    // Once the button is pressed, don't override the random color
    if (!_buttonPressed) {
      _iconColor = textColor;
    }

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

            // Activity icon (emoji)
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: [
                  Icon(
                    Icons.fitness_center_rounded,
                    size: 300.0,
                    color: _iconColor,
                  ),
                  Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: _iconColor,
                    ),
                  ),
                ],
              ),
            ),

            // 'Let's run it' button at the bottom
            Padding(
              // 40.0 from the bottom of the screen
              padding: const EdgeInsets.only(bottom: 40.0),
              child: FractionallySizedBox(
                // 80% of screen width
                widthFactor: 0.8,

                child: ElevatedButton(
                  // Button action
                  onPressed: () {
                    // TODO add button functionality
                    setState(() {
                      _iconColor = Color(Random().nextInt(0xFFFFFFFF));
                      _buttonPressed = true;
                    });
                  },

                  // Button style
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 20.0),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),

                  // Button text
                  child: const Text(
                    "Let's run it",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

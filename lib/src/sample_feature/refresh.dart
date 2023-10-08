import 'dart:math';
import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';

// Default text style
const TextStyle textStyle = TextStyle(
  fontSize: 30.0,
  color: ThemeColor.text,
);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/sample_item';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  int _iconColor = ThemeColor.text.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'How about...',
                  style: textStyle,
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
                    color: Color(_iconColor),
                  ),
                  Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Color(_iconColor),
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
                      _iconColor = Random().nextInt(0xFFFFFFFF);
                    });
                  },

                  // Button style
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 20.0),
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

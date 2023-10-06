import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/sample_item';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  int _iconColor = 0xFF141414;

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
                  // TODO pick text style
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF141414),
                  ),
                ),
              ),
            ),

            // Activity icon (emoji)
            Center(
              child: Icon(
                Icons.fitness_center_rounded,
                size: 300.0,
                // TODO pick color
                color: Color(_iconColor),
                //fromRGB(20, 20, 20),
              ),
            ),

            // 'Let's run it' button at the bottom
            Padding(
              // 40.0 from the botto mof the screen
              padding: const EdgeInsets.only(bottom: 40.0),
              child: FractionallySizedBox(
                // 80% of screen width
                widthFactor: 0.8,

                child: ElevatedButton(
                  // Button action
                  onPressed: () {
                    // TODO add button functionality here
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

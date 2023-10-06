import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

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
            const Center(
              child: Icon(
                Icons.fitness_center_rounded,
                size: 300.0,
                // TODO pick color
                color: Color(0xFF141414),
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

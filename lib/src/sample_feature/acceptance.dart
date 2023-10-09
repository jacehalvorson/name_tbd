import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';

class AcceptanceButton extends StatelessWidget {
  const AcceptanceButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    Brightness brightness = Theme.of(context).brightness;
    Color primaryColor = ThemeColor.getColor(ColorType.primary, brightness);

    return Padding(
      // 40.0 from the bottom of the screen
      padding: const EdgeInsets.only(bottom: 40.0),
      child: FractionallySizedBox(
        // 80% of screen width
        widthFactor: 0.8,

        child: ElevatedButton(
          // Button action which is passed in as parameter
          onPressed: onPressed,

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
    );
  }
}

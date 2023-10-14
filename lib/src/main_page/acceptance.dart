import 'package:flutter/material.dart';

const buttonPaddingBottom = 40.0;
const buttonWidthFactor = 0.8;

class AcceptanceButton extends StatelessWidget {
  const AcceptanceButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      // 40.0 from the bottom of the screen
      padding: const EdgeInsets.only(bottom: buttonPaddingBottom),
      child: FractionallySizedBox(
        // 80% of screen width
        widthFactor: buttonWidthFactor,

        child: ElevatedButton(
          // Button action which is passed in as parameter
          onPressed: onPressed,

          // Button style
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0),
            ),
            backgroundColor: MaterialStateProperty.all(colorScheme.primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),

          // Button text
          child: Text(
            "Let's run it",
            style: TextStyle(fontSize: 24, color: colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}

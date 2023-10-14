import 'package:flutter/material.dart';

const buttonPaddingBottom = 80.0;
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
      child: Container(
        height: 65,
        child: FractionallySizedBox(
          // 80% of screen width
          widthFactor: buttonWidthFactor,
      
          child: ElevatedButton(
            // Button action which is passed in as parameter
            onPressed: onPressed,
      
            // Button style
            style: ButtonStyle(
              // padding: MaterialStateProperty.all(
              //   const EdgeInsets.symmetric(vertical: 20.0),
              // ),
              backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
      
            // Button text
            child: Text(
              'Let\'s Run It',
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

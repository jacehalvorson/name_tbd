import 'package:flutter/material.dart';
import '../theme.dart';

class ActivityTile extends StatelessWidget {
  final String emoji;
  final String name;

  ActivityTile({
    required this.emoji,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 64, // Set the desired height
        decoration: BoxDecoration(
          color: ThemeColor.darkGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.centerLeft, // Vertically center content
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    emoji,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                Expanded(
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFFF9F9F9),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
                    iconSize: 28,
                    color: ThemeColor.text,
                    onPressed: () {
                      // Implement sorting logic here
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

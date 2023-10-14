import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String emoji;
  final String name;

  const ActivityTile({
    super.key,
    required this.emoji,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 64, // Set the desired height
        decoration: BoxDecoration(
          color: colorScheme.tertiary,
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
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                Expanded(
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
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
                    icon: const Icon(Icons.more_horiz),
                    iconSize: 28,
                    color: colorScheme.onBackground,
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

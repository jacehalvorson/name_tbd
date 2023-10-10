import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({Key? key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final List<String> emojis = ["🏂", "⛳️", "🧑‍💻", "🎮", "🏀", "🏋️"];
  final List<String> names = [
    "Snowboarding",
    "Golf",
    "Coding",
    "Video Games",
    "Basketball",
    "Workout"
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize:
          0.1, // Initial size when collapsed (10% of the screen height)
      minChildSize: 0.1, // Minimum size when collapsed
      maxChildSize: 0.8, // Maximum size when fully expanded
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        );
      },
    );
  }
}

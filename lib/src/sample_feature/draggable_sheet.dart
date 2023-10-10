import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';
import 'searchbar.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({Key? key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final DraggableScrollableController _scrollableController =
      DraggableScrollableController();

  final double openSize = 0.8;
  final double closeSize = 0.1;

  void _openSheet() {
    _scrollableController.animateTo(
      openSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
      controller: _scrollableController, // Pass the controller
      initialChildSize: closeSize,
      minChildSize: closeSize,
      maxChildSize: openSize,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Expanded(
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48.0, // Fixed height
                            color: Colors.blue, // Background color
                            // Other properties and widgets you want in the container
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 32,
                            color: ThemeColor.primary,
                          ),
                          onPressed: () {
                            _openSheet();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
         
        );
      },
    );
  }
}

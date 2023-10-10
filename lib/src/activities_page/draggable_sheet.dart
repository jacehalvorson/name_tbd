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
  final double closeSize = 0.14;

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
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ThemeColor.darkGray,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: CustomHeaderDelegate(openSheet: () {
                      _openSheet();
                    }),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                      childCount: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

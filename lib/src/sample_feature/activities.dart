import 'package:flutter/material.dart';
import 'package:refresh/src/theme.dart';
import 'activity_tile.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
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
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80, left: 14, right: 14),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 28,
                        color: ThemeColor.text,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Activities',
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Align children to the right
                    children: [
                      IconButton(
                        icon: Icon(Icons.swap_vert),
                        iconSize: 28,
                        color: ThemeColor.text,
                        onPressed: () {
                          // Implement sorting logic here
                        },
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Text(
                        'Sorting',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.transparent,
                            width: 2), // Yellow border around the ListView
                      ),
                      child: ListView.builder(
                        padding:
                            EdgeInsets.only(top: 0), // Set top padding to 0
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ActivityTile(
                            emoji: emojis[index],
                            name: names[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

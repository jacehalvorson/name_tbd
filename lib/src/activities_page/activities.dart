import 'package:flutter/material.dart';
import 'package:refresh/src/activities_list.dart';
import 'activity_tile.dart';
import 'draggable_sheet.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  static const routeName = '/activites';

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  void setActState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 14, right: 14),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          iconSize: 28,
                          color: colorScheme.onBackground,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Activities',
                            style: TextStyle(
                              // Consider changing the colorScheme
                              // 'onBackground' color to this
                              color: Color(0xFFF9F9F9),
                              fontSize: 32,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Align children to the right
                    children: [
                      IconButton(
                        icon: const Icon(Icons.swap_vert),
                        iconSize: 28,
                        color: colorScheme.onBackground,
                        onPressed: () {
                          // Implement sorting logic here
                        },
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      const Text(
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
                        padding: const EdgeInsets.only(
                            top: 0), // Set top padding to 0
                        itemCount: usersActivities.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ActivityTile(
                            emoji: activities[usersActivities[index]][0],
                            name: activities[usersActivities[index]][1],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          DraggableSheet(setActState: setActState)
        ],
      ),
    );
  }
}

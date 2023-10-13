import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:refresh/src/activities_page/activities.dart';
import 'package:refresh/src/main_page/acceptance.dart';
import 'package:refresh/src/theme.dart';
import 'package:refresh/src/main_page/activity.dart';
import 'package:refresh/src/types.dart';
import 'package:refresh/src/example_activities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../activities_list.dart';

const iconSize = 40.0;
const iconPaddingTop = 18.0;
const iconPaddingRight = 0.0;

// Buffer for loaded activities ready to be displayed
List<ActivityType> activityList = [];
const activityBufferSize = 3;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  // Default value, this is what will be first displayed to the user.
  int swipeCount = 0;
  DateTime? lastPressTime;

  // retrieve user's activities
  void retrieveUserActivities() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList('usersActivitiesSP');
    if (stringList != null) {
      usersActivities = stringList
          .map((string) => int.tryParse(string))
          .where((activity) => activity != null)
          .cast<int>()
          .toList();
    } else {
      usersActivities = <int>[];
    }
    print(usersActivities);
  }

  @override
  void initState() {
    super.initState();

    retrieveUserActivities();

    // Add example activities to activityList
    // These will be the first activities displayed to the user
    for (int i = 0; i < exampleActivities.length; i++) {
      activityList.add(exampleActivities[i]);
    }
  }

  // Callback function for a swipe
  // TODO Implement swipe mechanic to use this callback instead of the button
  void swipeCallback() {
    // Set the activity title to the randomly generated string
    setState(() {
      // Only increment swipe count if there hasn't been a button press
      // or if the last button press was more than swipeDuration (300 ms) ago
      if (lastPressTime == null ||
          DateTime.now().difference(lastPressTime!) > swipeDuration) {
        swipeCount++;

        lastPressTime = DateTime.now();
      }
    });
  }

  // Callback function passed to the AcceptanceButton
  // TODO Acceptance animation when user presses "Let's run it"
  void acceptanceCallback() {}

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    Brightness brightness = Theme.of(context).brightness;
    Color backgroundColor =
        ThemeColor.getColor(ColorType.background, brightness);
    Color primaryColor = ThemeColor.getColor(ColorType.primary, brightness);
    Color textColor = ThemeColor.getColor(ColorType.text, brightness);

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(top: iconPaddingTop, right: iconPaddingRight),
        child: Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, ActivitiesPage.routeName);
            },
            child: const Icon(Icons.hiking),
          ),
        ),
      ),
      body: Stack(
        children: [
          // If we add some backgound (image, gradient, pattern, etc.)
          // this is where to put it.
          // For example:
          // BackgroundElement(),

          ...List.generate(activityBufferSize, (index) {
            int adjustedIndex = swipeCount + index - 2;
            adjustedIndex = (adjustedIndex < 0) ? 0 : adjustedIndex;
            int onDeckIndex = (adjustedIndex + 1);
            DisplayPosition displayPosition;

            if (adjustedIndex == swipeCount) {
              displayPosition = DisplayPosition.onScreen;
            } else if (adjustedIndex >= onDeckIndex) {
              displayPosition = DisplayPosition.belowScreen;
            } else {
              displayPosition = DisplayPosition.aboveScreen;
            }

            print(
                'activity ${activityList[adjustedIndex].id}: ${activityList[adjustedIndex].title}');
            print('displayIndex: ${displayPosition}');

            return SlidingActivityWidget(
              activity: activityList[adjustedIndex],
              displayPosition: displayPosition,
            );
          }),

          // Layout for the 'How about...' text and 'Let's run it' button
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 'How about...' text at the top
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'How about...',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: textColor,
                    ),
                  ),
                ),
              ),

              // 'Let's run it' button at the bottom
              AcceptanceButton(onPressed: swipeCallback)
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

import 'acceptance_button.dart';
import 'activity_widget.dart';
import '../activities_page/activities.dart';
import '../util/types.dart';
import '../util/get_next_activity.dart';
import '../activities_list.dart';

const iconSize = 40.0;
const iconPaddingTop = 18.0;
const iconPaddingRight = 0.0;

const headerPaddingTop = 18.0;
const headerPaddingHorizontal = 24.0;

const SWIPE_SENSITIVITY = 8;
const SWIPE_STRENGTH_FACTOR = 2.5;
const CURRENT_TOP_VALUE_OFFSET_MAX = 100;

final random = Random();

// Buffer for loaded activities ready to be displayed
List<Activity> activityList = [];
const activityBufferSize = 3;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

/// Displays detailed information about a SampleItem.
class _MainPageState extends State<MainPage> {
  int swipeCount = 0;
  int currentTopValueOffset = 0;
  DateTime? lastSwipeTime;

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
    for (int i = 0; i < activityBufferSize; i++) {
      activityList.add(getNextActivity(usersActivities));
    }
  }

  // Callback function during a swipe (gets called several times per second)
  void swipeCallback(DragUpdateDetails details) {
    // Only execute if there hasn't been a swipe
    // or if the last swipe was more than swipeDuration (300 ms) ago
    if (lastSwipeTime == null ||
        DateTime.now().difference(lastSwipeTime!) > swipeDuration) {
      // Change its y position based on how strong the swipe is
      currentTopValueOffset +=
          (details.delta.dy * SWIPE_STRENGTH_FACTOR).round();

      // Ensure that the offset is within the bounds
      if (currentTopValueOffset > CURRENT_TOP_VALUE_OFFSET_MAX) {
        currentTopValueOffset = CURRENT_TOP_VALUE_OFFSET_MAX;
      } else if (currentTopValueOffset < CURRENT_TOP_VALUE_OFFSET_MAX * -1) {
        currentTopValueOffset = CURRENT_TOP_VALUE_OFFSET_MAX * -1;
      }

      setState(() {});
    }
  }

  // Callback function for when a swipe ends
  void swipeEndCallback(DragEndDetails details) {
    // If the swipe is strong enough, move the activity off the screen
    if (currentTopValueOffset.abs() > CURRENT_TOP_VALUE_OFFSET_MAX / 2) {
      // Find the index of the activity that is not onscreen during this transition
      int indexToBeReplaced = ((-1 * swipeCount) + 1) % activityBufferSize;

      // Pick the next activity according to the algorithm
      Activity nextActivity = getNextActivity(usersActivities);

      // Add the new activity to the buffer. This will be below the screen
      // after this transition.
      activityList[indexToBeReplaced] = nextActivity;

      // Mark this activity as shown
      if (!shownActivities.contains(nextActivity.id)) {
        shownActivities.add(nextActivity.id);
        print('shownActivities: $shownActivities');
      }

      // Change the swipe count based on direction
      if (currentTopValueOffset > 0) {
        swipeCount--;
      } else {
        swipeCount++;
      }
    }

    // Reset the offset
    currentTopValueOffset = 0;
    setState(() {});
  }

  // temporary debug function to clear shared prefs
  Future<void> clearSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Callback function passed to the AcceptanceButton
  // TODO Acceptance animation when user presses "Let's run it"
  void acceptanceCallback() {
    print('button pressed');
  }

  @override
  Widget build(BuildContext context) {
    // Get the current color scheme
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        swipeCallback(details);
      },
      onVerticalDragEnd: (details) {
        swipeEndCallback(details);
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: Stack(
          children: [
            // If we add some backgound (image, gradient, pattern, etc.)
            // this is where to put it.
            // For example:
            // BackgroundElement(),

            ...List.generate(activityBufferSize, (index) {
              int adjustedIndex = (index + swipeCount) % activityBufferSize;

              DisplayPosition displayPosition;
              switch (adjustedIndex) {
                case 0:
                  displayPosition = DisplayPosition.aboveScreen;
                  break;
                case 1:
                  displayPosition = DisplayPosition.belowScreen;
                  break;
                default:
                  displayPosition = DisplayPosition.onScreen;
              }

              return SlidingActivityWidget(
                activity: activityList[index],
                displayPosition: displayPosition,
                currentTopValueOffset: currentTopValueOffset,
              );
            }),

            // Layout for the 'How about...' text and 'Let's run it' button
            Padding(
              padding: const EdgeInsets.only(
                  top: 80,
                  right: headerPaddingHorizontal,
                  left: headerPaddingHorizontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How About...',
                        style: TextStyle(
                          color: colorScheme.onBackground,
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.hiking),
                        iconSize: iconSize,
                        color: colorScheme.onBackground,
                        onPressed: () {
                          // clearSharedPrefs();
                          // Navigate to the activities page. If the user leaves and returns
                          // to the app after it has been killed while running in the
                          // background, the navigation stack is restored.
                          Navigator.restorablePushNamed(
                              context, ActivitiesPage.routeName);
                        },
                      ),
                    ],
                  ),

                  // 'Let's run it' button at the bottom
                  AcceptanceButton(onPressed: acceptanceCallback)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

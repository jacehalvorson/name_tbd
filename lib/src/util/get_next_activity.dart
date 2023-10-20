import 'dart:math';
import 'package:refresh/src/activities_list.dart';

import 'types.dart';
import '../example_activities.dart';

const CHANCE_OF_SHOWING_USER_ACTIVITY = 0.5;
final random = Random();

// This function is called to add to the activity buffer
Activity getNextActivity(List<int> userActivities) {
  Activity? nextActivity;

  if (exampleActivities.isEmpty) {
    return Activity(id: -1, title: '', icon: '');
  }

  while (true) {
    // 50% of the time choose from userActivities, otherwise choose from all activities.
    // If userActivities is empty, choose from all activities.
    if (userActivities.isNotEmpty &&
        computePercentageChance(CHANCE_OF_SHOWING_USER_ACTIVITY)) {
      // Pick random activity from user's activities
      nextActivity = exampleActivities[
          userActivities[random.nextInt(userActivities.length)]];
      print('user activity');
    } else {
      // Pick random activity from all options
      nextActivity =
          exampleActivities[random.nextInt(exampleActivities.length)];
      print('random activity');
    }

    // Confirm this activity selection if it hasn't been shown before
    // OR there are no more activities to show. Otherwise keep trying.
    if (!shownActivities.contains(nextActivity.id) ||
        shownActivities.length >= exampleActivities.length) {
      break;
    }
  }

  return nextActivity;
}

bool computePercentageChance(double percentage) {
  return random.nextDouble() < percentage;
}

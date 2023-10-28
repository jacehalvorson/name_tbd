// ignore_for_file: constant_identifier_names

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
    } else {
      // Pick random activity from all options
      nextActivity =
          exampleActivities[random.nextInt(exampleActivities.length)];
    }

    // If this activity hasn't been shown, return it
    if (!shownActivities.contains(nextActivity.id)) {
      break;
    }

    // Check if all activities have been shown
    if (shownActivities.length >= exampleActivities.length) {
      // Reset list of shown activities now that all activities have been shown
      shownActivities = [];
      break;
    }
  }

  return nextActivity;
}

bool computePercentageChance(double percentage) {
  return random.nextDouble() < percentage;
}

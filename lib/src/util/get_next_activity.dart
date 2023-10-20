import 'dart:math';
import 'package:refresh/src/activities_list.dart';

import 'types.dart';

import '../example_activities.dart';

const CHANCE_OF_SHOWING_USER_ACTIVITY = 0.5;

final random = Random();

// This function is called to add to the activity buffer.
// It modifies shownActivities.
Activity getNextActivity(List<int> userActivities) {
  Activity? nextActivity;

  if (exampleActivities.isEmpty) {
    return Activity(id: -1, title: '', icon: '');
  }

  if (userActivities.isNotEmpty &&
      computePercentageChance(CHANCE_OF_SHOWING_USER_ACTIVITY)) {
    // Pick random activity from user's activities
    nextActivity = exampleActivities[
        userActivities[random.nextInt(userActivities.length)]];
    print('user activity');
  } else {
    // Pick random activity from all options
    nextActivity = exampleActivities[random.nextInt(exampleActivities.length)];
    print('random activity');
  }

  shownActivities.add(nextActivity.id);
  print('shownActivities: ${shownActivities}');
  return nextActivity;
}

bool computePercentageChance(double percentage) {
  return random.nextDouble() < percentage;
}

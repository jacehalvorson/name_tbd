import 'dart:math';
import 'types.dart';

const reRandomizeChance = 0.7;

final random = Random();

Activity getNextActivity(userActivities, allActivities) {
  Activity nextActivity = Activity(
    id: -1,
    title: '',
    icon: '',
  );

  while (true) {
    // Pick random activity from all options
    nextActivity = allActivities[random.nextInt(allActivities.length)];

    // After picking an activity, if it is a user-selected one then return that.
    if (userActivities.contains(nextActivity.id)) {
      break;
    }

    // Otherwise, there is a 70% chance of re-randomizing the activity.
    if (random.nextDouble() > reRandomizeChance) {
      // Note: This if statement uses inverse logic. If the random number is
      // between 0.7 and 1.0 (30%), then it will use this activity.
      break;
    }
  }

  return nextActivity;
}

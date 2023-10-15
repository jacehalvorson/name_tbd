class Activity {
  int id;
  String title;
  String icon;

  Activity({required this.id, required this.title, required this.icon});
}

enum DisplayPosition {
  belowScreen,
  onScreen,
  aboveScreen,
}

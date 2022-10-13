class HomeTab {
  final int id;
  final String label;
  final HomeTabType type;
  final double position;
  HomeTab(
      {required this.id,
      required this.label,
      required this.type,
      required this.position});
}

enum HomeTabType { all, running, cardio, yoga, pilatis }

class MuscleTab {
  final int id;
  final String label;
  final MuscleTabType type;
  final double position;
  MuscleTab(
      {required this.id,
      required this.label,
      required this.type,
      required this.position});
}

enum MuscleTabType { fullbody, core, abs, arm, leg }

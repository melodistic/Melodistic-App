import 'package:melodistic/widgets/common/type/section.type.dart';

class Section {
  final String name;
  final SectionType type;
  final String exerciseType;
  final String mood;
  final int duration;
  final List<String> includedMusicId;

  Section({
    required this.name,
    required this.type,
    required this.exerciseType,
    required this.mood,
    required this.duration,
    this.includedMusicId = const <String>[],
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'section_name': name,
      'section_type': type.toString(),
      'mood': mood,
      'duration': duration,
      'music_ids': includedMusicId
    };
  }
}

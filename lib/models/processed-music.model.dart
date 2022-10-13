class ProcessedMusic {
  late String musicName;
  late int duration;
  late String mood;
  late String bpm;
  late bool isProcessing;

  ProcessedMusic({
    required this.musicName,
    required this.duration,
    required this.mood,
    required this.bpm,
    required this.isProcessing,
  });

  static ProcessedMusic fromJson(Map<String, dynamic> rawData) {
    return ProcessedMusic(
        musicName: (rawData['music_name'] ?? '').toString(),
        duration: int.parse((rawData['duration'] ?? '0').toString()),
        mood: (rawData['mood'] ?? '').toString(),
        bpm: (rawData['bpm'] ?? '').toString(),
        isProcessing: (rawData['is_favorite'] as bool?) ?? false);
  }
}

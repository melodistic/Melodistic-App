class ProcessedMusic {
  String processId;
  String musicName;
  int duration;
  String mood;
  String bpm;
  bool isProcessing;

  ProcessedMusic({
    required this.processId,
    required this.musicName,
    required this.duration,
    required this.mood,
    required this.bpm,
    required this.isProcessing,
  });

  static ProcessedMusic fromJson(Map<String, dynamic> rawData) {
    return ProcessedMusic(
        processId: (rawData['process_id'] ?? '').toString(),
        musicName: (rawData['music_name'] ?? '').toString(),
        duration: int.parse((rawData['duration'] ?? '0').toString()),
        mood: (rawData['mood'] ?? '').toString(),
        bpm: (rawData['bpm'] ?? '').toString(),
        isProcessing: (rawData['is_favorite'] as bool?) ?? false);
  }
}

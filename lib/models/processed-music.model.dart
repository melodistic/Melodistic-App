class ProcessedMusic {
  late String processId;
  late String userId;
  late String musicName;
  late int duration;
  late String mood;
  late String bpm;
  late String createAt;
  late String updateAt;
  late bool isProcessing;

  ProcessedMusic({
    required this.processId,
    required this.userId,
    required this.musicName,
    required this.duration,
    required this.mood,
    required this.bpm,
    required this.createAt,
    required this.updateAt,
    required this.isProcessing,
  });
  static ProcessedMusic get base {
    return ProcessedMusic(
        processId: '0',
        userId: '0',
        musicName: '',
        duration: 0,
        mood: '',
        bpm: '',
        createAt: '',
        updateAt: '',
        isProcessing: true);
  }

  static ProcessedMusic fromJson(Map<String, dynamic> rawData) {
    return ProcessedMusic(
        processId: rawData['process_id'].toString(),
        userId: (rawData['user_id'] ?? '').toString(),
        musicName: (rawData['music_name'] ?? '').toString(),
        duration: int.parse((rawData['duration'] ?? '0').toString()),
        mood: (rawData['mood'] ?? '').toString(),
        bpm: (rawData['bpm'] ?? '').toString(),
        createAt: (rawData['create_at'] ?? '').toString(),
        updateAt: (rawData['update_at'] ?? '').toString(),
        isProcessing: (rawData['is_favorite'] as bool?) ?? false);
  }
}

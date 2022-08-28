class Track {
  late String trackId;
  late String trackName;
  late String trackImageUrl;
  late String muscleGroup;
  late String description;
  late int duration;
  late bool isPublic;
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackImageUrl,
    required this.muscleGroup,
    required this.description,
    required this.duration,
    required this.isPublic,
  });
  static Track get base {
    return Track(
        trackId: '0',
        trackName: '',
        trackImageUrl: '',
        muscleGroup: '',
        description: '',
        duration: 0,
        isPublic: true);
  }

  static Track fromJson(Map<String, dynamic> rawData) {
    return Track(
        trackId: rawData['track_id'].toString(),
        trackName: (rawData['track_name'] ?? '').toString(),
        trackImageUrl: (rawData['track_image_url'] ?? '').toString(),
        muscleGroup: (rawData['muscle_group'] ?? '').toString(),
        description: (rawData['description'] ?? '').toString(),
        duration: int.parse((rawData['duration'] ?? '0').toString()),
        isPublic: rawData['is_public'] as bool);
  }
}

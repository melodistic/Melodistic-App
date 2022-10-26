class Track {
  String trackId;
  String trackName;
  String trackImageUrl;
  String muscleGroup;
  String description;
  int duration;
  bool isPublic;
  bool isFav;
  String tag;

  Track({
    required this.trackId,
    required this.trackName,
    required this.trackImageUrl,
    required this.muscleGroup,
    required this.description,
    required this.duration,
    required this.isPublic,
    required this.isFav,
    required this.tag,
  });

  static Track fromJson(Map<String, dynamic> rawData) {
    return Track(
        trackId: rawData['track_id'].toString(),
        trackName: (rawData['track_name'] ?? '').toString(),
        trackImageUrl: (rawData['track_image_url'] ?? '').toString(),
        muscleGroup: (rawData['muscle_group'] ?? '').toString(),
        description: (rawData['description'] ?? '').toString(),
        duration: int.parse((rawData['duration'] ?? '0').toString()),
        isPublic: (rawData['is_public'] as bool?) ?? false,
        isFav: (rawData['is_favorite'] as bool?) ?? false,
        tag: (rawData['tag'] ?? '').toString());
  }

  Track copyWith({
    String? trackId,
    String? trackName,
    String? trackImageUrl,
    String? muscleGroup,
    String? description,
    int? duration,
    bool? isPublic,
    bool? isFav,
    String? tag,
  }) {
    return Track(
      trackId: trackId ?? this.trackId,
      trackName: trackName ?? this.trackName,
      trackImageUrl: trackImageUrl ?? this.trackImageUrl,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      isPublic: isPublic ?? this.isPublic,
      isFav: isFav ?? this.isFav,
      tag: tag ?? this.tag,
    );
  }
}

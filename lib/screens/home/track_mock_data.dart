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
}

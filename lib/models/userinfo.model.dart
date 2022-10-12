class UserInfo {
  String email;
  String profileImage;
  int exerciseDurationHour;
  int exerciseDurationMinute;

  UserInfo(
      {required this.email,
      required this.profileImage,
      required this.exerciseDurationHour,
      required this.exerciseDurationMinute});

  static UserInfo fromJson(Map<String, dynamic> rawData) {
    return UserInfo(
        email: rawData['email'].toString(),
        profileImage: (rawData['user_profile_image'] ??
                'https://melodistic.me/api/storage/user-profile/default.png')
            .toString(),
        exerciseDurationHour: (rawData['exercise_duration_hour'] as int?) ?? 0,
        exerciseDurationMinute:
            (rawData['exercise_duration_minute'] as int?) ?? 0);
  }
}

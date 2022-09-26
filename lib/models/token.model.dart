class Token {
  late String token;

  Token({required this.token});

  static Token fromJson(Map<String, dynamic> rawData) {
    return Token(token: rawData['token'].toString());
  }
}

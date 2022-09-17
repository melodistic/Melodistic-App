class MelodisticException implements Exception {
  final String title;
  final String? description;

  MelodisticException(this.title, {this.description});
}

bool validateYoutubeLink(String url) {
  RegExp validator = RegExp(
      r'^http(s)?:\/\/(www\.)?((youtube\.com\/watch\?v=)|(youtu.be\/))(.)+$');
  return validator.hasMatch(url);
}

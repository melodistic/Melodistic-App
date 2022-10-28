import 'package:flutter/material.dart';
import 'package:melodistic/config/icon.dart';

IconData emojiFromMood(String mood) {
  if (mood == 'Chill') {
    return MelodisticIcon.emoji_talking_happy;
  }
  if (mood == 'Focus') {
    return MelodisticIcon.emoji_look_top;
  }
  if (mood == 'Party') {
    return MelodisticIcon.emoji_sing_right_note;
  }
  return MelodisticIcon.emoji_satisfied;
}

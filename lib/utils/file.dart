import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> getPhotoFromGallery() async {
  XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
    return imageFile;
  }
  return null;
}

Future<File?> getMusicFile() async {
  FilePickerResult? pickedSong = await FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: <String>['wav']);
  if (pickedSong != null) {
    File songFile = File(pickedSong.files.single.path!);
    return songFile;
  }
  return null;
}

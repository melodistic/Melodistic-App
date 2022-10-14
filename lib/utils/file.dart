import 'dart:io';
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

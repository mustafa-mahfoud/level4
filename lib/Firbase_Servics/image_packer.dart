import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePacker {
 Uint8List? imgPath;
    uploadImage(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        imgPath = await pickedImg.readAsBytes();
        // setState(() {
        //   //imgPath = File(pickedImg.path);
        // });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }
}
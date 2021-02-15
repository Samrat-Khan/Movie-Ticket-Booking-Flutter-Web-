import 'package:image_web_picker/image_web_picker.dart';

class PhotoPickerService {
  ImagePickerWeb imagePickerWeb = ImagePickerWeb();
  Future<void> pickPhoto() async {
    final pickedImage = await imagePickerWeb.getImage();
    print(pickedImage.toString());
  }
}

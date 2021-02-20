import 'dart:typed_data';

import 'package:image_picker_web/image_picker_web.dart';

class ImagePicker {
  Future pickPhoto() async {
    Uint8List bytesFromPicker =
        await ImagePickerWeb.getImage(outputType: ImageType.bytes);
    return bytesFromPicker;
  }
}

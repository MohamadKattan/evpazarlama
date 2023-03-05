import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageVal with ChangeNotifier, DiagnosticableTreeMixin {
  List<XFile>? _imageFileList;
  List<XFile>? get imageFileList => _imageFileList;

  void updatImagePickerState(List<XFile>? state) {
    _imageFileList = state;
    notifyListeners();
  }
}

import 'package:file_picker/file_picker.dart';

class FileHelper {
  ///选取文件
  ///需要将build.gradle文件中
  ///com.android.tools.build:gradle:3.5.0
  ///修改为
  ///com.android.tools.build:gradle:3.5.4或者其他更高版本
  static Future<FilePickerResult> getFiles({
    FileType type = FileType.image,
    bool allowMultiple = false,
    bool withData = false,
    List<String> allowedExtensions,
  }) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: type,
      allowMultiple: allowMultiple,
      withData: withData,
      allowedExtensions: allowedExtensions,
      allowCompression: false,
      withReadStream: false,
    );

    return result;
  }
}

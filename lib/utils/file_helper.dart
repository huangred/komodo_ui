import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

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

  static Future<String> getPath({String folder, String fileName}) async {
    folder = folder ?? '';

    Directory dir = await getApplicationDocumentsDirectory();
    String ret = path.join(dir.path, folder, fileName);

    return ret;
  }

  static Future<File> write(Uint8List bytes, String folder, String fileName, {FileMode mode = FileMode.write}) async {
    folder = await getPath(folder: folder);

    Directory dir = Directory(folder);
    if (dir.existsSync() == false) await dir.create();

    fileName = path.join(folder, fileName);
    File file = await File(fileName).writeAsBytes(bytes, mode: mode);

    return file;
  }
}

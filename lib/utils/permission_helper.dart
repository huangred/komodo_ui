import 'dart:io';
import 'package:komodo_ui/komodo_ui.dart';

import 'debug.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  ///打开系统设置
  static Future<bool> openSetting() async {
    return await openAppSettings();
  }

  ///检查并请求权限
  static Future<bool> hasPermission(Permission permission) async {
    try {
      PermissionStatus ps = await permission.status;
      if (ps.isGranted) return true;

      ps = await permission.request();

      return ps == PermissionStatus.granted;
    } catch (err) {
      LogHelper.err(err);
    }

    return false;
  }

  ///消息通知权限
  static Future<bool> checkNotification({bool showTip = true, String message, bool openSettings = true}) async {
    Permission permission = Permission.notification;
    bool ret = await hasPermission(permission);

    if (ret) return ret;

    if (showTip) {
      var ret = await MessageBox.alert(title: '提示', content: message ?? '您已禁用消息权限，请设置允许本app消息通知。');
      if (ret == AlertResult.cancel) return false;
    }

    if (openSettings) await openSetting();

    return false;
  }

  ///读写相册权限
  static Future<bool> checkAlbum({bool showTip = true, String message, bool openSettings = true}) async {
    Permission permission = Platform.isAndroid ? Permission.storage : Permission.photos;
    bool ret = await hasPermission(permission);

    if (ret) return true;

    if (showTip) {
      var ret = await MessageBox.alert(title: '提示', content: message ?? '您已禁用相册访问权限，请设置允许本app读写手机相册。');
      if (ret == AlertResult.cancel) return false;
    }

    if (openSettings) await openSetting();

    return false;
  }

  ///读图片位置信息权限
  static Future<bool> checkImageLocation({bool showTip = true, String message, bool openSettings = true}) async {
    if (Platform.isIOS) return true;
    Permission permission = Permission.accessMediaLocation;
    bool ret = await hasPermission(permission);

    if (ret) return true;

    if (showTip) {
      var ret = await MessageBox.alert(title: '提示', content: message ?? '您已禁用访问图片位置信息权限，请设置允许本app读写图片位置信息权限。');
      if (ret == AlertResult.cancel) return false;
    }

    if (openSettings) await openSetting();

    return false;
  }

  ///读写存储权限
  static Future<bool> checkStorage({bool showTip = true, String message, bool openSettings = true}) async {
    Permission permission = Permission.storage;
    bool ret = await hasPermission(permission);

    if (ret) return true;

    if (showTip) {
      var cfm = await MessageBox.alert(title: '提示', content: message ?? '您已禁用存储访问权限，请设置允许本app读写存储空间。');
      if (cfm == AlertResult.cancel) return false;
    }

    if (openSettings) await openSetting();

    return false;
  }
}

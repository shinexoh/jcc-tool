import 'package:android_intent_plus/android_intent.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:jinchanchan/widgets/dialog_style.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';

class AppUtil {
  /// 调用系统浏览器打开网页
  static void openUrl(String url) async {
    final intent = AndroidIntent(
      action: 'android.intent.action.VIEW',
      data: url,
    );

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
          subTitle: '打开浏览器失败，请点击下方复制网址后粘贴到浏览器打开！\n\n$url',
          okButtonTitle: '点击复制网址',
          showCanceButton: false,
          onOkButton: () {
            Get.back();
            Clipboard.setData(ClipboardData(text: url));
            showSnackBar('复制网址成功');
          });
    }
  }

  /// 检查网络是否可用
  static Future<bool> checkNetAvailability() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      final http = await HttpClient.get('https://juejin.cn/');
      return http.isOk ? true : false;
    }
    return false;
  }

  /// 打开应用设置界面
  static void openAppSettings() async {
    if (!await DeviceApps.openAppSettings('com.shinex.jinchanchan')) {
      showSnackBar('打开设置失败，请手动打开');
    }
  }

  /// 打开QQ名片主页
  static void openQQ(int qq) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=person&uin=$qq');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
        subTitle: '打开QQ失败，请手动添加QQ：$qq',
        showCanceButton: false,
        onOkButton: () => Get.back(),
      );
    }
  }

  /// 打开QQ群主页
  static void openQQGroup(int qqGroup) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=group&uin=$qqGroup');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
        subTitle: '打开QQ失败，请手动添加QQ群：$qqGroup',
        showCanceButton: false,
        onOkButton: () => Get.back(),
      );
    }
  }

  /// 设置状态栏样式Light
  static void setStatusBarLight() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  /// 设置状态栏样式Dark
  static void setStatusBarDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}

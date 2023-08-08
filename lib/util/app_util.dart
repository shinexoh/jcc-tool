import 'package:android_intent_plus/android_intent.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:oktoast/oktoast.dart';

class AppUtil {
  /// 检查网络是否可用
  static Future<bool> checkNetAvailability() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      final http = await HttpClient.get('https://www.baidu.com/');
      return http.isOk ? true : false;
    }
    return false;
  }

  ///打开应用设置界面
  static void openAppSettings() async {
    if (!await DeviceApps.openAppSettings('com.shinex.jinchanchan')) {
      showToast('打开设置失败，请手动打开');
    }
  }

  ///打开QQ群主页
  static void openQQGroup(int qqGroup) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=group&uin=$qqGroup');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      //弹窗
    }
  }
}

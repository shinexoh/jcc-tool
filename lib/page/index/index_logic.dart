import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/app_config.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/page/index/index_page.dart';
import 'package:jinchanchan/server/api.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:jinchanchan/util/app_util.dart';
import 'package:permission_handler/permission_handler.dart';

mixin IndexLogic on State<IndexPage> {
  final AppController appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    checkPermission();
    // checkUpdate();
  }

  // 检查存储权限
  void checkPermission() async {
    await Permission.storage.status == PermissionStatus.granted
        ? appController.setStoragePermission(true)
        : appController.setStoragePermission(false);
  }

  // 检查应用更新
  void checkUpdate() async {
    final httpUpdate = await HttpClient.get(Api.appUpdateApi);

    if (httpUpdate.isOk) {
      final version =
          httpUpdate.data['appupdate']['version'].toString().split('.').join();

      if (double.parse(version) > AppConfig.updateVersion) {
        Get.dialog(
          AlertDialog(
            title: Text(httpUpdate.data['update']['title']),
            content: Text(httpUpdate.data['update']['subtitle']),
            actions: [
              TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('退出')),
              FilledButton(
                  onPressed: () =>
                      AppUtil.openUrl(httpUpdate.data['update']['url']),
                  child: const Text('立即更新')),
            ],
          ),
          barrierDismissible: false,
        );
      }
    }
  }
}

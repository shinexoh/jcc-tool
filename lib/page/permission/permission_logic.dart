import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/app_config.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/page/permission/permission_page.dart';
import 'package:jinchanchan/widgets/dialog_style.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';
import 'package:permission_handler/permission_handler.dart';

mixin PermissionLogic on State<PermissionPage>, WidgetsBindingObserver {
  // 存储权限状态
  var permissionGranted = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Permission.storage.status == PermissionStatus.granted) {
        permissionGranted.value = true;
        Get.find<AppController>().setStoragePermission(true);

        Get.snackbar('', '',
            titleText: const Text('恭喜你！',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            messageText: const Text('存储权限授予成功，开启你的旅程吧！',
                style: TextStyle(color: Colors.black)));
      }
    }
  }

  // 点击授予按钮
  void onGrant() {
    permissionGranted.value ? Get.offAllNamed('/') : requestPermission();
  }

  // 请求权限
  void requestPermission() async {
    final request = await Permission.storage.request();

    if (request.isGranted) {
      permissionGranted.value = true;
      Get.find<AppController>().setStoragePermission(true);
    } else if (request.isDenied) {
      final newRequest = await Permission.storage.request();

      if (newRequest.isGranted) {
        permissionGranted.value = true;
        Get.find<AppController>().setStoragePermission(true);
      } else {
        storageDialog();
      }
    } else {
      storageDialog();
    }
  }

  // 点击跳过
  void onSkip() => Get.offAllNamed('/');

  // 存储权限被拒绝弹窗
  void storageDialog() {
    DialogStyle.mainDialog(
      title: '你已拒绝权限',
      subTitle:
          '由于${AppConfig.appName}需要【文件存储权限】才能正常使用，请点击【手动授予】跳转到设置，手动给${AppConfig.appName}授予【文件存储权限】',
      showCanceButton: false,
      okButtonTitle: '手动授予',
      onOkButton: () async {
        Get.back();
        if (!await DeviceApps.openAppSettings('com.shinex.jinchanchan')) {
          showSnackBar('打开设置失败，请手动打开');
        }
      },
    );
  }
}

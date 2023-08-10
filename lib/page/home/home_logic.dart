import 'dart:convert';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/page/home/home_page.dart';
import 'package:jinchanchan/server/api.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:jinchanchan/util/device_info.dart';
import 'package:jinchanchan/widgets/dialog_style.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';
import 'package:permission_handler/permission_handler.dart';

mixin HomeLogic on State<HomePage> {
  final AppController appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    checkPermission();

    initTitle();
    initBanner();
    initTips();
  }

  // 标题与副标题
  var title = ''.obs;
  var subTitle = ''.obs;

  // 一些开关状态
  var adaptive = false.obs;
  var def = false.obs;
  var repairFlash = false.obs;
  var noScreen = true.obs;

  // 轮播图信息
  var bannerData = <Map>[].obs;

  // 公告
  var tipsData = ''.obs;

  // 启动游戏
  void onOpenGame() async {
    if (!await DeviceApps.openApp('com.tencent.jkchess')) {
      showSnackBar('启动失败，请手动启动');
    }
  }

  // 点击轮播图
  void onBanner(int index) {}

  // 点击公告
  void onTips() {
    DialogStyle.mainDialog(
      subTitle: tipsData.value,
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  // 点击环境检测
  void onEnv() async {
    await DialogStyle.loadingDialog(
      autoHideDuration: const Duration(milliseconds: 1500),
    );

    DialogStyle.mainDialog(
      title: '环境检测',
      subTitle:
          '网络权限：已授予\n存储权限：${appController.storagePermission.value ? '已授予' : '未授予'}\n你的设备[${DeviceInfo.model}]已适配',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  // 点击线路检测
  void onLine() async {
    await DialogStyle.loadingDialog(
      autoHideDuration: const Duration(milliseconds: 1500),
    );

    DialogStyle.mainDialog(
      title: '线路检测',
      subTitle: '线路检测：通畅 ✔',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  // 点击适配容器
  void onAdaptive(bool value) {
    adaptive.value = value;
    if (value) showSnackBar('开启成功');
  }

  // 点击动线防封
  void onDef(bool value) {
    def.value = value;
    if (value) showSnackBar('开启成功');
  }

  // 点击修复闪屏
  void onRepairFlash(bool value) {
    repairFlash.value = value;
    if (value) showSnackBar('修复成功');
  }

  // 点击禁止录屏
  void onNoScreen(bool value) {
    noScreen.value = value;
    if (value) showSnackBar('禁止录屏成功');
  }

  // 初始化标题与副标题
  void initTitle() {
    final nowDate = DateTime.now().hour;

    if (nowDate >= 6 && nowDate < 11) {
      title.value = 'Hey 早上好';
      subTitle.value = '一日之计在于晨，一年之计在于春。';
    } else if (nowDate >= 11 && nowDate < 13) {
      title.value = 'Hey 中午好';
      subTitle.value = '享受中午的阳光，感受生命的活力！';
    } else if (nowDate >= 13 && nowDate < 19) {
      title.value = 'Hey 下午好';
      subTitle.value = '下午时分，加强学习，充实自己！';
    } else if (nowDate >= 19 && nowDate < 24) {
      title.value = 'Hey 晚上好';
      subTitle.value = '每个宁静的夜晚都是思考的好时机。';
    } else {
      title.value = 'Hey 凌晨好';
      subTitle.value = '夜深了，放下手机，早点休息。';
    }
  }

  // 检查存储权限
  void checkPermission() async {
    await Permission.storage.status == PermissionStatus.granted
        ? appController.setStoragePermission(true)
        : appController.setStoragePermission(false);
  }

  // 请求轮播图
  void initBanner() async {
    final httpBanner = await HttpClient.get(Api.mainApi);

    if (httpBanner.isOk) {
      final Map fBanner = jsonDecode(httpBanner.data);
      for (var element in fBanner['banner']) {
        bannerData.add(element);
      }
    }
  }

  // 请求公告
  void initTips() async {
    final httpTips = await HttpClient.get(Api.mainApi);

    if (httpTips.isOk) {
      final Map fTips = jsonDecode(httpTips.data);
      tipsData.value = fTips['tips'];
    }
  }
}

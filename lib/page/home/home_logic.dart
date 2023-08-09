import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/page/home/home_page.dart';
import 'package:jinchanchan/util/device_info.dart';
import 'package:jinchanchan/widgets/dialog_style.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';
import 'package:oktoast/oktoast.dart';

mixin HomeLogic on State<HomePage> {
  final AppController appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    initTitle();
  }

  // 标题与副标题
  var title = ''.obs;
  var subTitle = ''.obs;

  // 一些开关状态
  var adaptive = false.obs;
  var def = false.obs;
  var repairFlash = false.obs;
  var noScreen = true.obs;

  List<Map> bannerData = const [
    {
      'image': 'https://img.lovestu.com/uploads/2020/09/ghwxbanner.png',
      'title': '这是一个公众号推广图',
      'url': 'https://www.baidu.com/'
    },
    {
      'image': 'https://img.lovestu.com/uploads/2021/10/windows11banner1.png',
      'title': '这是微软的Windows11',
      'url': 'https://v.qq.com'
    },
    {
      'image': 'https://img.lovestu.com/uploads/2021/03/20210329.png',
      'title': '这是一个域名更换通知',
      'url': 'https://www.coolexe.com'
    },
  ];

  // 启动游戏
  void onOpenGame() async {
    if (!await DeviceApps.openApp('com.tencent.jkchess')) {
      showToast('启动失败，请手动启动');
    }
  }

  // 点击轮播图
  void onBanner(int index) {}

  // 点击公告
  void onTips() {}

  // 点击环境检测
  void onEnv() async {
    await DialogStyle.loadingDialog(
      autoHideDuration: const Duration(milliseconds: 1500),
    );

    DialogStyle.mainDialog(
      title: '环境检测',
      subTitle: '手机型号${DeviceInfo.model}已适配',
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
}

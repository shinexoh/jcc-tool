import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/assets_config.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/util/device_info.dart';
import 'package:jinchanchan/widgets/on_ink.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final AppController appController = Get.find<AppController>();

  var brand = ''.obs;
  var model = ''.obs;
  var androidVersion = ''.obs;
  var sdkVersion = ''.obs;
  var res = ''.obs;
  var cpu = ''.obs;
  var battery = 0.obs;

  @override
  void initState() {
    super.initState();

    brand.value = DeviceInfo.brand;
    model.value = DeviceInfo.model;
    androidVersion.value = DeviceInfo.androidVersion;
    sdkVersion.value = DeviceInfo.sdkVersion.toString();
    res.value = '${DeviceInfo.screenHeight}×${DeviceInfo.screenWidth}';
    cpu.value = DeviceInfo.cpu;
    battery.value = DeviceInfo.batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topAppBar(),
                imageBar(),
                permissionBar(),
                deviceInfoBar(),
                helpBar(),
              ],
            ),
          ),
        ));
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('我的',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('我的信息与设备信息', style: TextStyle(color: Colors.grey)),
            ],
          )),
    );
  }

  Widget imageBar() {
    return Center(
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              image:
                  const DecorationImage(image: AssetImage(AssetsConfig.user)),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 30)
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '我是应用名称',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget permissionBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
      ),
      child: Column(
        children: [
          OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            onTap: appController.storagePermission.value
                ? null
                : onStoragePermission,
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Remix.folder_line, color: Colors.orange)),
              const SizedBox(width: 15),
              const Text('存储权限', style: TextStyle(fontSize: 16)),
              const Spacer(),
              Text(appController.storagePermission.value ? '已授予' : '点击授予',
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget deviceInfoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)]),
      child: Column(children: [
        //手机品牌
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.information_line, color: Colors.teal)),
          const SizedBox(width: 15),
          const Text('手机品牌', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(brand.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //手机型号
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.indigoAccent.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.smartphone_line,
                  color: Colors.indigoAccent)),
          const SizedBox(width: 15),
          const Text('手机型号', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(model.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //安卓版本
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.android_line, color: Colors.green)),
          const SizedBox(width: 15),
          const Text('安卓版本', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(androidVersion.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //SDK版本
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.bug_2_line, color: Colors.purple)),
          const SizedBox(width: 15),
          const Text('SDK版本', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(sdkVersion.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //分辨率
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.tablet_line, color: Colors.deepOrange)),
          const SizedBox(width: 15),
          const Text('分辨率', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(res.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //处理器
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Remix.cpu_line, color: Colors.pink)),
          const SizedBox(width: 15),
          const Text('处理器', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(cpu.value,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 16),
        //电量
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Remix.battery_2_charge_line, color: Colors.cyan)),
          const SizedBox(width: 15),
          const Text('当前电量', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(battery.value == 100 ? '已充满' : '${battery.value}%',
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
      ]),
    );
  }

  Widget helpBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
      ),
      child: Column(
        children: [
          OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            onTap: onUseHelp,
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Remix.question_line, color: Colors.blue)),
              const SizedBox(width: 15),
              const Text('使用帮助', style: TextStyle(fontSize: 16)),
              const Spacer(),
              const Text('点击查看',
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ]),
          ),
        ],
      ),
    );
  }

  void onStoragePermission() => Get.toNamed('/permission');

  void onUseHelp() => Get.toNamed('/usehelp');
}

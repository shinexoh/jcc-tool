import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/app_config.dart';
import 'package:jinchanchan/app/assets_config.dart';
import 'package:jinchanchan/page/permission/permission_logic.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver, PermissionLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              Image.asset(AssetsConfig.permission,
                  height: Get.height * 0.2, width: double.infinity),
              const SizedBox(height: 20),
              const Text('请授予存储权限',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text(
                  '由于${AppConfig.appName}需要手机“存储权限”才能正常使用，为了你的完整体验，请授予${AppConfig.appName}存储权限！',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const Spacer(),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: AnimatedButton(
                          text: permissionGranted.value ? '进入画质侠' : '立即授予',
                          height: 45,
                          isFixedHeight: false,
                          color: Colors.deepOrange,
                          pressEvent: onGrant,
                        ),
                      ),
                      SizedBox(width: permissionGranted.isFalse ? 10 : 0),
                      if (permissionGranted.isFalse)
                        TextButton(onPressed: onSkip, child: const Text('跳过')),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

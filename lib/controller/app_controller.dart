import 'package:get/get.dart';

/// 主要的状态控制器
class AppController extends GetxController {
  // 存储权限
  var storagePermission = false.obs;
  void setStoragePermission(bool value) => storagePermission.value = value;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 显示SnackBar
void showSnackBar(String msg) {
  final SnackBar snackBar = SnackBar(
    content: Text(msg),
    dismissDirection: DismissDirection.horizontal,
  );

  ScaffoldMessenger.of(Get.context!)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

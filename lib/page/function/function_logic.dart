import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/page/function/function_page.dart';

mixin FunctionLogic on State<FunctionPage> {
  void onSortTop() {
    Get.toNamed('/sorttop');
  }

  void onSortMinor() {
    Get.toNamed('/sortminor');
  }

  void onSortMiddle() {
    Get.toNamed('/sortmiddle');
  }

  void onSortLow() {
    Get.toNamed('/sortlow');
  }
}

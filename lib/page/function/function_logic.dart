import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/page/function/function_page.dart';
import 'package:jinchanchan/server/api.dart';
import 'package:jinchanchan/server/http_client.dart';

mixin FunctionLogic on State<FunctionPage> {
  @override
  void initState() {
    super.initState();
    initFunction();
  }

  // 功能列表
  var functionData = <Map>[].obs;

  // 请求功能列表
  void initFunction() async {
    final httpFunction = await HttpClient.get(Api.mainApi);

    if (httpFunction.isOk) {
      final Map fFuntionc = jsonDecode(httpFunction.data);

      for (var element in fFuntionc['function']) {
        functionData.add(element);
      }
    }
  }
}

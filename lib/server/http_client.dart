import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HttpClient {
  static HttpClient? _instance;

  static late Dio _dio;

  HttpClient._() {
    _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 7),
        receiveTimeout: const Duration(seconds: 7)));
  }

  static HttpClient getInstance() => _instance ??= HttpClient._();

  static Future<HttpData> get(String url) async {
    debugPrint('开始请求：$url');

    Response response;

    try {
      response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        debugPrint('请求成功：${response.statusCode}');

        return HttpData(isOk: true, data: response.data);
      } else {
        debugPrint('请求失败：${response.statusCode}');

        return HttpData(
            isOk: false, errorMsg: '请求失败，状态码：${response.statusCode}');
      }
    } catch (e) {
      debugPrint('捕抓到错误');

      return HttpData(isOk: false, errorMsg: '请求错误：$e');
    }
  }
}

class HttpData {
  bool isOk;
  dynamic data;
  String? errorMsg;

  HttpData({
    required this.isOk,
    this.data,
    this.errorMsg,
  });
}

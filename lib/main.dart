import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/app_theme.dart';
import 'package:jinchanchan/controller/app_controller.dart';
import 'package:jinchanchan/page/index/index_page.dart';
import 'package:jinchanchan/page/permission/permission_page.dart';
import 'package:jinchanchan/page/sort/sort_page.dart';
import 'package:jinchanchan/page/use_help_page.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:jinchanchan/util/app_util.dart';
import 'package:jinchanchan/util/device_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 设置Dark风格状态栏
  AppUtil.setStatusBarDark();

  // 初始化实例
  Get.put(AppController());
  HttpClient.getInstance();
  await DeviceInfo.getInstance();

  if (await AppUtil.checkNetAvailability()) {
    runApp(const MyApp('/'));
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '金铲铲',
      color: Colors.white,
      theme: AppTheme.light,
      initialRoute: initialRoute,
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(name: '/', page: () => const IndexPage()),
        GetPage(name: '/sort', page: () => const SortPage()),
        GetPage(name: '/usehelp', page: () => const UseHelpPage()),
        GetPage(name: '/permission', page: () => const PermissionPage())
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('zh', 'CN')],
      builder: (context, child) {
        // 禁止字体大小跟随系统变化
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jinchanchan/app/app_config.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationIcon: const FlutterLogo(size: 45),
                applicationName: '金铲铲',
                applicationVersion: AppConfig.appVersion,
                applicationLegalese: '这是一款金铲铲科技应用',
              );
              // SnackBar snackBar = const SnackBar(
              //   content: Text('设置成功'),
              //   dismissDirection: DismissDirection.horizontal,
              // );
              // ScaffoldMessenger.of(context)
              //   ..removeCurrentSnackBar()
              //   ..showSnackBar(snackBar);
            },
            child: const Text('查看许可'),
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jinchanchan/app/assets_config.dart';
import 'package:jinchanchan/page/function/function_logic.dart';
import 'package:jinchanchan/widgets/common_card.dart';
import 'package:jinchanchan/widgets/on_ink.dart';

class FunctionPage extends StatefulWidget {
  const FunctionPage({super.key});

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> with FunctionLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            optionBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('功能',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('更多自定义功能', style: TextStyle(color: Colors.grey)),
            ],
          )),
    );
  }

  Widget optionBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CommonCard(
            image: AssetsConfig.sortTop,
            color: Colors.deepOrange,
            title: '基础配置',
            subTitle: '这是一个基础配置功能表',
            child: OnInk(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              onTap: onSortTop,
              child: const Text('点击查看',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.sortMinor,
            color: Colors.deepOrange,
            title: '时空裂缝',
            subTitle: '这是一个时空裂缝功能表',
            child: OnInk(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              onTap: onSortMinor,
              child: const Text('点击查看',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.sortMiddle,
            color: Colors.deepOrange,
            title: '符文大陆传奇',
            subTitle: '这是一个符文大陆传奇功能表',
            child: OnInk(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              onTap: onSortMiddle,
              child: const Text('点击查看',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.sortLow,
            color: Colors.deepOrange,
            title: '狂暴模式',
            subTitle: '这是一个狂暴模式功能表',
            child: OnInk(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              onTap: onSortLow,
              child: const Text('点击查看',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

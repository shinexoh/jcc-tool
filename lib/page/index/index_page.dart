import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/page/user_page.dart';
import 'package:jinchanchan/page/function/function_page.dart';
import 'package:jinchanchan/page/home/home_page.dart';
import 'package:jinchanchan/page/index/index_logic.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with IndexLogic {
  var pageIndex = 0.obs;

  List<Widget> get pageBody => const [HomePage(), FunctionPage(), UserPage()];

  List<SalomonBottomBarItem> get items => [
        SalomonBottomBarItem(
            icon: const Icon(Remix.home_smile_line),
            activeIcon: const Icon(Remix.home_smile_fill),
            selectedColor: Colors.deepOrange,
            unselectedColor: Colors.black54,
            title: const Text('首页')),
        SalomonBottomBarItem(
            icon: const Icon(Remix.game_line),
            activeIcon: const Icon(Remix.game_fill),
            selectedColor: Colors.blue,
            unselectedColor: Colors.black54,
            title: const Text('功能')),
        SalomonBottomBarItem(
          icon: const Icon(Remix.emotion_happy_line),
          activeIcon: const Icon(Remix.emotion_happy_fill),
          selectedColor: Colors.green,
          unselectedColor: Colors.black54,
          title: const Text('我的'),
        ),
      ];

  void onTap(int index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
            child: SalomonBottomBar(
              curve: Curves.bounceOut,
              backgroundColor: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              currentIndex: pageIndex.value,
              onTap: (index) => onTap(index),
              items: items,
            ),
          ),
          body: IndexedStack(
            index: pageIndex.value,
            children: pageBody,
          ),
        ));
  }
}

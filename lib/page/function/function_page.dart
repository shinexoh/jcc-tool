import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Obx(
        () => functionData.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topAppBar(),
                    optionBar(),
                  ],
                ),
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
              Text('更多精选功能', style: TextStyle(color: Colors.grey)),
            ],
          )),
    );
  }

  Widget optionBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: List.generate(functionData.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == functionData.length - 1 ? 20 : 10,
            ),
            child: CommonCard(
              image: functionData[index]['image'] ?? AssetsConfig.sort,
              color: Colors.deepOrange,
              title: functionData[index]['title'],
              subTitle: functionData[index]['subtitle'],
              networkImage: functionData[index]['image'] == null ? false : true,
              child: OnInk(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                onTap: () => Get.toNamed('/sort'),
                child: const Text('点击查看',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

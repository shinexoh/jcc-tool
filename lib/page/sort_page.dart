import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/assets_config.dart';
import 'package:jinchanchan/widgets/on_ink.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  late final Map arguments;

  @override
  void initState() {
    super.initState();
    arguments = Get.arguments;
    debugPrint(arguments.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoBar(),
            itemBar(),
          ],
        ),
      ),
    );
  }

  Widget infoBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        const Icon(Remix.chat_smile_2_line),
        const SizedBox(width: 10),
        Expanded(child: Text(arguments['subtitle'])),
      ]),
    );
  }

  Widget itemBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(arguments['list'].length, (index) {
            return SizedBox(
              width: (Get.width - 30) / 2,
              child: OnInk(
                color: Colors.deepOrange.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
                padding: const EdgeInsets.all(15),
                onTap: onItem,
                child: Row(children: [
                  Image.asset(AssetsConfig.star, height: 22, width: 22),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      arguments['list'][index],
                      style: const TextStyle(
                          fontSize: 15, color: Colors.deepOrange),
                    ),
                  ),
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onItem() => showSnackBar('开启成功！');
}

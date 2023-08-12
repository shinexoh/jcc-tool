import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/widgets/show_snackbar.dart';
import 'package:jinchanchan/widgets/use_button.dart';
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
    return Column(
      children: List.generate(arguments['list'].length, (index) {
        return UseButton(
          title: arguments['list'][index],
          margin: EdgeInsets.only(
            top: index == 0 ? 20 : 0,
            left: 10,
            right: 10,
            bottom: index == arguments['list'].length - 1 ? 20 : 15,
          ),
          onTap: (value) => onItem(value),
        );
      }),
    );
  }

  void onItem(bool value) {
    if (value) showSnackBar('开启成功');
  }
}

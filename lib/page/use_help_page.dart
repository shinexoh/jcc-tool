import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/server/api.dart';
import 'package:jinchanchan/server/http_client.dart';
import 'package:jinchanchan/widgets/on_ink.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class UseHelpPage extends StatefulWidget {
  const UseHelpPage({super.key});

  @override
  State<UseHelpPage> createState() => _UseHelpPageState();
}

class _UseHelpPageState extends State<UseHelpPage> {
  var useHelpData = <Map>[].obs;

  @override
  void initState() {
    super.initState();
    initUseHelp();
  }

  // 初始化帮助列表
  void initUseHelp() async {
    final httpUseHelp = await HttpClient.get(Api.mainApi);

    if (httpUseHelp.isOk) {
      final Map rUseHelp = httpUseHelp.data;

      for (var element in rUseHelp['help']) {
        useHelpData.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('使用帮助'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: Obx(
        () => useHelpData.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: itemBar(),
              ),
      ),
    );
  }

  Widget itemBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(useHelpData.length, (index) {
        return OnInk(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          margin: EdgeInsets.only(
            top: index == 0 ? 20 : 0,
            left: 10,
            right: 10,
            bottom: index == useHelpData.length - 1 ? 20 : 15,
          ),
          padding: const EdgeInsets.all(10),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Icon(Remix.magic_line),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    useHelpData[index]['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        letterSpacing: 0.8,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Text(useHelpData[index]['subtitle'],
                  style: const TextStyle(color: Colors.black54)),
            ],
          ),
        );
      }),
    );
  }
}

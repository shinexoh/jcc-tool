import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinchanchan/app/assets_config.dart';
import 'package:jinchanchan/page/home/home_logic.dart';
import 'package:jinchanchan/widgets/common_card.dart';
import 'package:jinchanchan/widgets/on_ink.dart';
import 'package:jinchanchan/widgets/outlined_text_button.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            bannerBar(),
            tipsBar(),
            textBar('检测专区'),
            optionBar(),
            textBar('优化工具'),
            switchBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title.value,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(subTitle.value,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  )),
              GestureDetector(
                onTap: onOpenGame,
                child: const Row(children: [
                  Icon(Remix.rocket_line),
                  SizedBox(width: 5),
                  Text('启动',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ]),
              ),
            ],
          )),
    );
  }

  Widget bannerBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: Get.height * 0.18,
        width: double.infinity,
        child: Obx(() => bannerData.isEmpty
            ? const SizedBox()
            : Swiper(
                itemCount: bannerData.length,
                autoplay: true,
                viewportFraction: 0.85,
                scale: 0.92,
                onTap: (index) => onBanner(index),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(bannerData[index]['image']),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 10,
                          right: 10,
                        ),
                        child: Text(
                          bannerData[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              )),
      ),
    );
  }

  Widget tipsBar() {
    return Obx(() => tipsData.isEmpty
        ? const SizedBox()
        : OnInk(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            onTap: onTips,
            child: Row(children: [
              const Icon(Remix.chat_smile_2_line),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  tipsData.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
          ));
  }

  Widget optionBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CommonCard(
              image: AssetsConfig.env,
              title: '环境检测',
              subTitle: '检测该机型是否适配',
              child: OutlinedTextButton(title: '点击检测', onTap: onEnv)),
          const SizedBox(height: 10),
          CommonCard(
              image: AssetsConfig.line,
              title: '线路检测',
              subTitle: '检测线路是否稳定',
              child: OutlinedTextButton(title: '点击检测', onTap: onLine)),
        ],
      ),
    );
  }

  Widget switchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CommonCard(
            image: AssetsConfig.adaptive,
            title: '适配容器',
            subTitle: '没Root权限的请开启此功能',
            child: Obx(
              () => Switch(
                value: adaptive.value,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) => onAdaptive(value),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.def,
            title: '动线防封',
            subTitle: '出现封号请开启此功能',
            child: Obx(
              () => Switch(
                value: def.value,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) => onDef(value),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.repairFlash,
            title: '修复闪屏',
            subTitle: '游戏中出现闪屏请开启此功能',
            child: Obx(
              () => Switch(
                value: repairFlash.value,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) => onRepairFlash(value),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CommonCard(
            image: AssetsConfig.banScreen,
            title: '禁止录屏',
            subTitle: '直播中可勾选此功能',
            child: Obx(
              () => Switch(
                value: noScreen.value,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) => onNoScreen(value),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget textBar(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 12),
      child: Text(text,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic)),
    );
  }
}

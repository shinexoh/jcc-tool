import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UseButton extends StatefulWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  final void Function(bool) onTap;

  const UseButton({
    super.key,
    required this.title,
    this.margin,
    required this.onTap,
  });

  @override
  State<UseButton> createState() => _UseButtonState();
}

class _UseButtonState extends State<UseButton> {
  var switchValue = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              Row(children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('推荐',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 13))),
                const SizedBox(width: 5),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('已优化',
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ]),
            ],
          ),
          Obx(() => Switch(
              value: switchValue.value,
              inactiveThumbColor: Colors.grey,
              onChanged: (value) {
                widget.onTap(value);
                switchValue.value = value;
              })),
        ],
      ),
    );
  }
}

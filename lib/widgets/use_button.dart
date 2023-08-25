import 'package:flutter/material.dart';
import 'package:jinchanchan/widgets/outlined_text_button.dart';

class UseButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  const UseButton({
    super.key,
    required this.title,
    this.margin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
              Text(title, style: const TextStyle(fontSize: 15)),
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
          OutlinedTextButton(title: '点击开启', onTap: onTap),
        ],
      ),
    );
  }
}

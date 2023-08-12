import 'package:flutter/material.dart';
import 'package:jinchanchan/widgets/on_ink.dart';

/// 常用的轮毂文本按钮封装
class OutlinedTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OutlinedTextButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnInk(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200)),
        child: Text(title,
            style: const TextStyle(
                fontSize: 13,
                color: Colors.deepOrange,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}

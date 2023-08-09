import 'package:flutter/material.dart';

/// 首页的卡片封装
class HomeCard extends StatelessWidget {
  final String image;
  final Color color;
  final String title;
  final String subTitle;
  final Widget child;

  const HomeCard({
    super.key,
    required this.image,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.1), blurRadius: 10),
        ],
        gradient: LinearGradient(
          transform: const GradientRotation(5),
          colors: [Colors.white, color, color],
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Image.asset(image, height: 45, width: 45),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
          const Spacer(),
          child,
        ],
      ),
    );
  }
}

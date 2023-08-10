import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 首页的卡片封装
class CommonCard extends StatelessWidget {
  final String image;
  final bool networkImage;
  final Color color;
  final String title;
  final String subTitle;
  final Widget child;

  const CommonCard({
    super.key,
    required this.image,
    this.networkImage = false,
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
            child: networkImage
                ? FadeInImage.memoryNetwork(
                    height: 45,
                    width: 45,
                    placeholder: kTransparentImage,
                    fadeInDuration: const Duration(milliseconds: 300),
                    fit: BoxFit.cover,
                    image: image,
                  )
                : FadeInImage(
                    height: 45,
                    width: 45,
                    placeholder: MemoryImage(kTransparentImage),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          child,
        ],
      ),
    );
  }
}

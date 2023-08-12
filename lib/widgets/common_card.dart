import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 首页的卡片封装
class CommonCard extends StatelessWidget {
  final String image;
  final double? imageSize;
  final bool networkImage;
  final String title;
  final String subTitle;
  final Widget child;

  const CommonCard({
    super.key,
    required this.image,
    this.imageSize,
    this.networkImage = false,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          networkImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(22.5),
                  child: FadeInImage.memoryNetwork(
                    height: imageSize ?? 45,
                    width: imageSize ?? 45,
                    placeholder: kTransparentImage,
                    fadeInDuration: const Duration(milliseconds: 300),
                    fit: BoxFit.cover,
                    image: image,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(22.5),
                  child: FadeInImage(
                    height: imageSize ?? 45,
                    width: imageSize ?? 45,
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
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
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

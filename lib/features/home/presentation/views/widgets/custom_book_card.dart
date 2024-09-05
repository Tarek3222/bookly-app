import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CustomBookCard extends StatelessWidget {
  const CustomBookCard({
    super.key,
    required this.imageUrl, this.onTap,
  });
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  Text(
                    "Image Not Found",
                    style: TextStyle(fontSize: 7, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key, required this.image, required this.title, required this.subTitle});
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(image),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: Styles.textStyle20
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
             subTitle,
              textAlign: TextAlign.center,
              style: Styles.textStyle14.copyWith(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ],
      );
  }
}
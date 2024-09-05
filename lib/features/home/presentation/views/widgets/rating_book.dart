import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class RatingBook extends StatelessWidget {
  const RatingBook({super.key, this.mainAxisAlignment, required this.rating, required this.count});
  final MainAxisAlignment? mainAxisAlignment;
  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($count)",
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}



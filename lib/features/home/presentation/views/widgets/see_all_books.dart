import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SeeAllBestNewestItems extends StatelessWidget {
  const SeeAllBestNewestItems({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Row(
        children: [
          Text(
            "See all",
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
         const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}

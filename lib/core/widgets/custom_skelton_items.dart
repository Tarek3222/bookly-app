import 'package:bookly/core/widgets/custom_skelton.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeltonItems extends StatelessWidget {
  const CustomSkeltonItems({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CustomSkelton();
          }
        ),
      ),
    );
  }
}
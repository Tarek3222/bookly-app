import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/Material.dart';

class SomeDetailsAboutBook extends StatelessWidget {
  const SomeDetailsAboutBook({super.key, required this.title, required this.subTitle});

 final String title;
 final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: Colors.greenAccent.shade200,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subTitle,
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

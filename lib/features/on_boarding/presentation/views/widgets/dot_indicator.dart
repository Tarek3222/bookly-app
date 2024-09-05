import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key,  this.isActive=false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kTranstionDuration,
      child: Container(
        height: isActive ? 12 : 4,
        width: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:isActive ? kPrimaryColor:kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
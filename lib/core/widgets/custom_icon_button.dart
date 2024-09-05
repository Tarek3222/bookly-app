

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed:onPressed,
          icon:  Icon(
            icon,
            color: Colors.white,
          ),
        );
  }
}
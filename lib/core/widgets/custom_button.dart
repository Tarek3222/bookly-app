import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.backgroundColor, required this.textStyle, required this.text, required this.borderRadius,this.onPressed});
  final Color backgroundColor;
  final TextStyle textStyle;
  final String text;
  final BorderRadius borderRadius;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          overlayColor: Colors.black,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(text,style: textStyle,),
      ),
    );
  }
}
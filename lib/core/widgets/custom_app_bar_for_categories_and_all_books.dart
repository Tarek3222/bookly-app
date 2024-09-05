import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarForCategoriesAndAllBooks extends StatelessWidget {
  const CustomAppBarForCategoriesAndAllBooks({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon:  Icon(
              Icons.close,
              color: Colors.white.withOpacity(0.88),
              size: 24,
            ),
          ),
          Text(
            title,
            style: Styles.textStyle18.copyWith(
              color: Colors.white.withOpacity(0.88),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bookly/core/widgets/custom_app_bar.dart';
import 'package:bookly/features/categories/presentation/views/widgets/custom_grid_categories.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomAppBar(),
          CustomGridCategories()
        ],
      ),
    );
  }
}

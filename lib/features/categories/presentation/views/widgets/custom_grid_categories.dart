import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/features/categories/data/models/category_model.dart';
import 'package:bookly/features/categories/presentation/views/widgets/custom_item_category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomGridCategories extends StatelessWidget {
  const CustomGridCategories({super.key});
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = CategoryModel.categories;
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBooksByCategoryView,extra: categories[index]);
        },
        child: CustomItemCategory(
          category: categories[index],
        ),
      ),
      itemCount: categories.length,
    );
  }
}

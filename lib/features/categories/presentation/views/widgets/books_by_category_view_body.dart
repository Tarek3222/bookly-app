import 'package:bookly/core/widgets/custom_app_bar_for_categories_and_all_books.dart';
import 'package:bookly/features/categories/data/models/category_model.dart';
import 'package:bookly/features/categories/presentation/views/widgets/boos_items_list_view.dart';
import 'package:flutter/material.dart';

class BooksByCategoryViewBody extends StatelessWidget {
  const BooksByCategoryViewBody({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          children: [
            CustomAppBarForCategoriesAndAllBooks(
              title:category.name,
            ),
            const Expanded(
              child: BoosItemsListView(),
            ),
          ],
        ),
    );
  }
}
import 'package:bookly/core/widgets/custom_app_bar_for_categories_and_all_books.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class SeeAllBooksViewBody extends StatelessWidget {
  const SeeAllBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBarForCategoriesAndAllBooks(title: "All Books",),
          Expanded(child: NewestBooksListView(
            physics: BouncingScrollPhysics(),
          )),
        ],
      ),
    );
  }
}

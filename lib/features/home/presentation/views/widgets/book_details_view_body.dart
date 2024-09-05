import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                  Padding(
                  padding:const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: CutomBookDetailsAppBar(book :book),
                ),
                const SizedBox(
                  height: 18,
                ),
                 BookDetailsSection(book : book),
               const SizedBox(
                  height: 25,
                ),
               const SimilarBooksSection(),
              const  SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}



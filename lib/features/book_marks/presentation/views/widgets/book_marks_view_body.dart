import 'package:bookly/core/widgets/custom_app_bar.dart';
import 'package:bookly/features/book_marks/presentation/views/widgets/books_fav_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookMarksViewBody extends StatelessWidget {
  const BookMarksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Expanded(child: BooksFavListView(),),
        ],
      ),
    );
  }
}
import 'package:bookly/features/home/presentation/views/widgets/see_all_books_view_body.dart';
import 'package:flutter/material.dart';

class SeeAllBooksView extends StatelessWidget {
  const SeeAllBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SeeAllBooksViewBody(),
    );
  }
}

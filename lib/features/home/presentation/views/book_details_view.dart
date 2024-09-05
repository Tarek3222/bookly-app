import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.book.volumeInfo!.categories?[0]??"programming");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(book:widget.book),
    );
  }
}
import 'package:bookly/features/categories/data/models/category_model.dart';
import 'package:bookly/features/categories/presentation/views/widgets/books_by_category_view_body.dart';
import 'package:bookly/features/categories/presentation/views_model/books_by_categories/books_by_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksByCategoryView extends StatefulWidget {
  const BooksByCategoryView({super.key, required this.category});
  final CategoryModel category;

  @override
  State<BooksByCategoryView> createState() => _BooksByCategoryViewState();
}

class _BooksByCategoryViewState extends State<BooksByCategoryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BooksByCategoriesCubit>(context).fetchBooksByCategory(category: widget.category.name);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BooksByCategoryViewBody(category: widget.category,),
    );
  }
}

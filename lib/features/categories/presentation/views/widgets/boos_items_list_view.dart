import 'package:bookly/core/widgets/book_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_skeleton_books_list_view.dart';
import 'package:bookly/features/categories/presentation/views_model/books_by_categories/books_by_categories_cubit.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BoosItemsListView extends StatelessWidget {
  const BoosItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksByCategoriesCubit,BooksByCategoriesState>(
      builder: (context, state) {
        if (state is BooksByCategoriesSuccess) {
          List<BookModel> books = state.books;
          return ListView.builder(
          physics:const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>  Padding(
            padding:const EdgeInsets.only(
              left: 10,
              bottom: 8,
            ),
            child: BookItem(
              book: books[index],
            ),
          ),
          itemCount: books.length,
        );
        }else if(state is BooksByCategoriesFailure){
          return CustomErrorWidget(error: state.message);
        }else{
          return const CustomSkeletonBooksListView();
        }
      },
    );
  }
}

import 'package:bookly/core/widgets/book_item.dart';
  import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_skeleton_books_list_view.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, this.physics});

  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          List<BookModel> books = state.books;
          return ListView.builder(
          physics: physics,
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
        }else if(state is NewestBooksFailure){
          return CustomErrorWidget(error: state.errorMessage);
        }else{
          return const CustomSkeletonBooksListView();
        }
      },
    );
  }
}

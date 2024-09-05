import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:bookly/core/widgets/book_item.dart';
import 'package:bookly/features/book_marks/presentation/view_model/fav_books/fav_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksFavListView extends StatelessWidget {
  const BooksFavListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavBooksCubit, FavBooksState>(
      builder: (context, state) {
        if(state is FavBooksSuccess){
          List<BookModel> books =BlocProvider.of<FavBooksCubit>(context).books;
          if(books.isEmpty){
            return const Center(child: Text("No Books Found in Favourites"),);
          }else {
            return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 8,
            ),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (_){
                BlocProvider.of<FavBooksCubit>(context).removeBook(books[index]);
                showSnackBar(context: context, text: "Book removed from favourites", color: Colors.redAccent);
              },
              child: BookItem(
                book: books[index],
              ),
            ),
          ),
          itemCount: books.length,
        );
          }
        }else {
          return const Center(child: Text("No Books Found in Favourites"),);
        }
      },
    );
  }
}

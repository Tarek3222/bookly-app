import 'package:bookly/core/widgets/book_item.dart';
import 'package:bookly/core/widgets/custom_skeleton_books_list_view.dart';
import 'package:bookly/features/search/presentation/views%20model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: BookItem(book: state.books[index]),
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchBooksFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/not_found.jpg",
                width: 190,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "No Result Found, try again",
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        } else if (state is SearchBooksInitial) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/result.jpg",
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "No Result Found, search now",
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        } else {
          return const CustomSkeletonBooksListView();
        }
      },
    );
  }
}

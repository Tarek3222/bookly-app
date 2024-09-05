import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_skelton_items.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooskListView extends StatelessWidget {
  const FeaturedBooskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          List<BookModel> books = state.books;
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return CustomBookCard(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,extra: books[index],
                      );
                    },
                    imageUrl: books[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                  );
                },
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(error: state.errorMessage);
        } else if (state is FeaturedBooksLoading) {
          return  Padding(
            padding:const EdgeInsets.only(left: 12),
            child: CustomSkeltonItems(height: MediaQuery.of(context).size.height * 0.29,),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

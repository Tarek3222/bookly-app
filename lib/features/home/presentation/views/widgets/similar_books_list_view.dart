import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_skelton_items.dart';
import 'package:bookly/features/home/presentation/views_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
          return SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  CustomBookCard(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                },
                imageUrl:
                    state.books[index].volumeInfo?.imageLinks?.thumbnail ?? "",
              );
            },
          ),
        );
        }else if(state is SimilarBooksFailure){
          return CustomErrorWidget(error: state.errorMessage);
        }else{
          return CustomSkeltonItems(height: MediaQuery.of(context).size.height * 0.18,);
        }
      },
    );
  }
}

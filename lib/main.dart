import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/book_marks/presentation/view_model/fav_books/fav_books_cubit.dart';
import 'package:bookly/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/features/home/presentation/views_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FavBooksCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/categories/data/models/category_model.dart';
import 'package:bookly/features/categories/data/repo/categories_repo_implement.dart';
import 'package:bookly/features/categories/presentation/views/books_by_category_view.dart';
import 'package:bookly/features/categories/presentation/views_model/books_by_categories/books_by_categories_cubit.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/features/home/presentation/views_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/main_view.dart';
import 'package:bookly/features/home/presentation/views/see_all_books_view.dart';
import 'package:bookly/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:bookly/features/search/data/repo/seach_repo_implement.dart';
import 'package:bookly/features/search/presentation/views%20model/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookDetailsView';
  static const String kSearchView = '/searchView';
  static const String konBoardingView = '/onBoardingView';
  static const String kSeeAllBooksView = '/seeAllBooksView';
  static const String kBooksByCategoryView = '/booksByCategoryView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: konBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImplement>(),
          ),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            getIt.get<SearchRepoImplement>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kSeeAllBooksView,
        builder: (context, state) => const SeeAllBooksView(),
      ),
      GoRoute(
        path: kBooksByCategoryView,
        builder: (context, state) => BlocProvider(
          create: (context) => BooksByCategoriesCubit(
            getIt.get<CategoriesRepoImplement>(),
          ),
          child: BooksByCategoryView(
            category: state.extra as CategoryModel,
          ),
        ),
      ),
    ],
  );
}

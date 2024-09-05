import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/categories/data/repo/categories_repo_implement.dart';
import 'package:bookly/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/features/search/data/repo/seach_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<CategoriesRepoImplement>(
    CategoriesRepoImplement(
      getIt.get<ApiService>(),
    ),
  );
}

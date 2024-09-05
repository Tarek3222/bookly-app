import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement extends SearchRepo {
  final ApiService apiService;
  SearchRepoImplement(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String searchText}) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?q=intitle:$searchText&Filtering=ebooks",
      );
      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
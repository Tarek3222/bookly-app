import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/categories/data/repo/categories_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoriesRepoImplement extends CategoriesRepo{
  ApiService apiService;

  CategoriesRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBooksByCategory({required String category})async {
     try {
      var data = await apiService.get(
        endPoint:
            "volumes?q=subject:$category&Filtering=ebooks",
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
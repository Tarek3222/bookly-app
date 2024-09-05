import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesRepo {
  Future<Either<Failure,List<BookModel>>> fetchBooksByCategory({required String category});
}
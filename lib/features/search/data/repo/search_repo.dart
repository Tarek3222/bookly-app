import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<BookModel>>> fetchSearchBooks({required String searchText});
}
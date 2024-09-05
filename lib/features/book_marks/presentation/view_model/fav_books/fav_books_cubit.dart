import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_books_state.dart';

class FavBooksCubit extends Cubit<FavBooksState> {
  FavBooksCubit() : super(FavBooksInitial());
  List<BookModel> books = [];

  void addBook(BookModel book) {
  books.add(book);
  emit(FavBooksSuccess());
  }

  void removeBook(BookModel book) {
    books.remove(book);
    if(books.isEmpty){
      emit(FavBooksInitial());
    }else{
      emit(FavBooksSuccess());
    }
  }
}

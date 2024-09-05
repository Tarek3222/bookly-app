import 'package:bookly/features/categories/data/repo/categories_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_by_categories_state.dart';

class BooksByCategoriesCubit extends Cubit<BooksByCategoriesState> {
  BooksByCategoriesCubit(this.categoriesRepo) : super(BooksByCategoriesInitial());

  final CategoriesRepo categoriesRepo;

    Future<void> fetchBooksByCategory({required String category}) async {
    emit(BooksByCategoriesLoading());
    var result = await categoriesRepo.fetchBooksByCategory(category: category);
    result.fold((failure) {
      emit(
        BooksByCategoriesFailure(message: failure.errorMessage),
      );
    }, (books) {
      emit(BooksByCategoriesSuccess(books:books));
    });
  }
}

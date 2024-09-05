part of 'books_by_categories_cubit.dart';

sealed class BooksByCategoriesState extends Equatable {
  const BooksByCategoriesState();

  @override
  List<Object> get props => [];
}

final class BooksByCategoriesInitial extends BooksByCategoriesState {}
final class BooksByCategoriesSuccess extends BooksByCategoriesState {
  final List<BookModel> books;
  const BooksByCategoriesSuccess({required this.books});
}
final class BooksByCategoriesLoading extends BooksByCategoriesState {}
final class BooksByCategoriesFailure extends BooksByCategoriesState {
  final String message;
  const BooksByCategoriesFailure({required this.message});
}

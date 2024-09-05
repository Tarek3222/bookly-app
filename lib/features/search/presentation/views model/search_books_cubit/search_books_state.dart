part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}
final class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> books;
  const SearchBooksSuccess({required this.books});
}
final class SearchBooksLoading extends SearchBooksState {}
final class SearchBooksFailure extends SearchBooksState {
  final String message;
  const SearchBooksFailure({required this.message});
}

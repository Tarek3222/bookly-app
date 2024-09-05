part of 'fav_books_cubit.dart';

sealed class FavBooksState extends Equatable {
  const FavBooksState();

  @override
  List<Object> get props => [];
}

final class FavBooksInitial extends FavBooksState {}

class FavBooksSuccess extends FavBooksState {}


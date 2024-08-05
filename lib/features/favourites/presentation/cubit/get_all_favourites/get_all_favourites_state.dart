part of 'get_all_favourites_cubit.dart';

@immutable
sealed class GetAllFavouritesState {}

final class GetAllFavouritesInitial extends GetAllFavouritesState {}

final class GetAllFavouritesLoading extends GetAllFavouritesState {}

final class GetAllFavouritesSuccess extends GetAllFavouritesState {
  final List<FavouriteModel> favourites;

  GetAllFavouritesSuccess(this.favourites);
}

final class GetAllFavouritesFailure extends GetAllFavouritesState {
  final String errorMessage;

  GetAllFavouritesFailure(this.errorMessage);
}

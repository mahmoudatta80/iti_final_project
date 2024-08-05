part of 'toggle_favourite_cubit.dart';

@immutable
sealed class ToggleFavouriteState {}

final class ToggleFavouriteInitial extends ToggleFavouriteState {}

final class ToggleFavouriteSuccess extends ToggleFavouriteState {
  final bool isFavourite;

  ToggleFavouriteSuccess(this.isFavourite);
}

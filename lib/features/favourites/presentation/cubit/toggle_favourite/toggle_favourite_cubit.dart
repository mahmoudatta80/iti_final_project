import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:iti_final_project/features/favourites/data/repo/favourites_repo.dart';

part 'toggle_favourite_state.dart';

class ToggleFavouriteCubit extends Cubit<ToggleFavouriteState> {
  final FavouritesRepo favouritesRepo;

  ToggleFavouriteCubit(this.favouritesRepo) : super(ToggleFavouriteInitial());

  Future toggleFavourite(
      FavouriteModel favouriteModel, Map<int, bool> isFavourite) async {
    if (isFavourite[favouriteModel.id] == true) {
      await favouritesRepo.deleteDataFromDatabase(favouriteModel.id);
      isFavourite[favouriteModel.id] = false;
      emit(ToggleFavouriteSuccess(true));
    } else {
      await favouritesRepo.insertToDatabase(favouriteModel);
      isFavourite[favouriteModel.id] = true;
      emit(ToggleFavouriteSuccess(false));
    }
  }
}

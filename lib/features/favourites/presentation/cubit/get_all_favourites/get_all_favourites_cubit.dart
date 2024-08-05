import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/features/favourites/data/repo/favourites_repo.dart';

part 'get_all_favourites_state.dart';

class GetAllFavouritesCubit extends Cubit<GetAllFavouritesState> {
  final FavouritesRepo favouritesRepo;

  GetAllFavouritesCubit(this.favouritesRepo) : super(GetAllFavouritesInitial());

  Map<int, bool> isFavourites = {};

  Future getAllFavourites() async {
    emit(GetAllFavouritesLoading());

    final result = await favouritesRepo.getAllFavourite();

    result.fold(
      (failure) => emit(GetAllFavouritesFailure(failure.message)),
      (favourites) {
        for (FavouriteModel favouriteModel in favourites) {
          isFavourites.addAll({favouriteModel.id: true});
        }
        print('===================isFavourite=======================');
        return emit(GetAllFavouritesSuccess(favourites));
      },
    );
  }
}

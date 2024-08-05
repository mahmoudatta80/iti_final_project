import 'package:dartz/dartz.dart';
import 'package:iti_final_project/core/errors/cache_helper_failure.dart';
import 'package:iti_final_project/core/errors/failure.dart';
import 'package:iti_final_project/core/utils/cache_helper.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:sqflite/sqflite.dart';

class FavouritesRepo {
  final CacheHelper cacheHelper;

  FavouritesRepo(this.cacheHelper);

  Future<Either<Failure, List<FavouriteModel>>> getAllFavourite() async {
    try {
      List<FavouriteModel> favourites = [];
      final response = await cacheHelper.getAllDataFromDatabase();
      for (var item in response) {
        favourites.add(FavouriteModel.fromMap(item));
      }
      return Right(favourites);
    } catch (error) {
      if (error is DatabaseException) {
        return Left(CacheHelperFailure.fromCacheHelperException(error));
      } else {
        return Left(CacheHelperFailure.fromMessage(error.toString()));
      }
    }
  }

  Future insertToDatabase(FavouriteModel favouriteModel) async {
    await cacheHelper.insertDataToDatabase(favouriteModel);
  }

  Future deleteDataFromDatabase(int id) async {
    await cacheHelper.deleteDataFromDataBase(id);
  }
}

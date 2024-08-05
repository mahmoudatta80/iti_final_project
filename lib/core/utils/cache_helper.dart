import 'package:iti_final_project/core/utils/constant.dart';
import 'package:iti_final_project/features/favourites/data/models/favourite_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CacheHelper {
  Database? database;
  String tableName = 'favourites';

  createDatabase(Database database, int version) async {
    print('object=======================================');
    await database.execute(
      'CREATE TABLE $tableName (id INTEGER, title TEXT, description TEXT, category TEXT, image TEXT, price REAL)',
    );
  }

  Future<Database?> initDatabase() async {
    if (database == null) {
      String path = join(await getDatabasesPath(), Constants.databaseName);
      database = await openDatabase(
        path,
        version: 1,
        onCreate: createDatabase,
      );
      return database;
    }
    return database;
  }

  Future insertDataToDatabase(FavouriteModel favouriteModel) async {
    await database!.insert(tableName, favouriteModel.toMap());
  }

  Future getAllDataFromDatabase() async {
    return await database!.query(tableName);
  }

  Future deleteDataFromDataBase(int id) async {
    await database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}

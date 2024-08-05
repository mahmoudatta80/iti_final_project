import 'package:iti_final_project/core/errors/failure.dart';
import 'package:sqflite/sqflite.dart';

class CacheHelperFailure extends Failure{
  CacheHelperFailure(super.message);

  factory CacheHelperFailure.fromCacheHelperException(DatabaseException cacheHelperException) {
    if (cacheHelperException.isSyntaxError()) {
      return CacheHelperFailure('There was a syntax error in the SQL query.');
    } else if (cacheHelperException.isDatabaseClosedError()) {
      return CacheHelperFailure('The database has been closed.');
    } else if (cacheHelperException.isUniqueConstraintError()) {
      return CacheHelperFailure('A unique constraint was violated.');
    } else if (cacheHelperException.isNoSuchTableError()) {
      return CacheHelperFailure('The specified table does not exist.');
    } else if (cacheHelperException.isReadOnlyError()) {
      return CacheHelperFailure('The database is read-only.');
    } else {
      return CacheHelperFailure('An unknown SQLite error occurred.');
    }
  }

  factory CacheHelperFailure.fromMessage(String message) {
    return CacheHelperFailure(message);
  }
}
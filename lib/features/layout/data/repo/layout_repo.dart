import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iti_final_project/core/errors/failure.dart';
import 'package:iti_final_project/core/errors/server_failure.dart';
import 'package:iti_final_project/core/utils/api_service.dart';
import 'package:iti_final_project/core/utils/end_points.dart';
import 'package:iti_final_project/features/layout/data/models/category_model.dart';

class LayoutRepo {
  final ApiService apiService;

  LayoutRepo(this.apiService);

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      List<CategoryModel> categories = [];
      final response = await apiService.get(endPoint: EndPoints.categories);
      for (var item in response) {
        categories.add(CategoryModel.fromJson(item));
      }
      return Right(categories);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

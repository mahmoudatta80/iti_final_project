import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iti_final_project/core/errors/failure.dart';
import 'package:iti_final_project/core/errors/server_failure.dart';
import 'package:iti_final_project/core/utils/api_service.dart';
import 'package:iti_final_project/core/utils/end_points.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';

class SingleCategoryRepo {
  final ApiService apiService;

  SingleCategoryRepo(this.apiService);

  Future<Either<Failure, List<ProductModel>>> getSingleCategoryProducts(
      String categoryName) async {
    try {
      List<ProductModel> singleCategoryProducts = [];
      final response = await apiService.get(
        endPoint: '${EndPoints.singleCategory}$categoryName',
      );
      for (var item in response['products']) {
        singleCategoryProducts.add(ProductModel.fromJson(item));
      }
      return Right(singleCategoryProducts);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

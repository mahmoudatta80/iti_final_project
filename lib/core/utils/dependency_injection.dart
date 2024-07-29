import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_final_project/core/utils/api_service.dart';
import 'package:iti_final_project/core/utils/dio_setup.dart';
import 'package:iti_final_project/features/home/data/repo/home_repo.dart';
import 'package:iti_final_project/features/home/presentation/cubit/products_cubit/products_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // web services
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      DioSetup.createAndSetUpDio(),
    ),
  );

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(
        getIt(),
      ));

  // get products cubit
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(
      getIt(),
    ),
  );
}

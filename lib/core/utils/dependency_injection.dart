import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_final_project/core/utils/api_service.dart';
import 'package:iti_final_project/core/utils/dio_setup.dart';
import 'package:iti_final_project/features/home/data/repo/home_repo.dart';
import 'package:iti_final_project/features/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:iti_final_project/features/layout/data/repo/layout_repo.dart';
import 'package:iti_final_project/features/layout/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:iti_final_project/features/login/data/repo/login_repo.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login/login_cubit.dart';
import 'package:iti_final_project/features/single_category/presentation/cubit/get_single_category/get_single_category_cubit.dart';
import 'package:iti_final_project/features/single_category/repo/single_category_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // web services
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      DioSetup.createAndSetUpDio(),
    ),
  );

  // layout
  getIt.registerLazySingleton<LayoutRepo>(
    () => LayoutRepo(
      getIt(),
    ),
  );

  // get categories cubit
  getIt.registerFactory<GetCategoriesCubit>(
    () => GetCategoriesCubit(
      getIt(),
    ),
  );

  // home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt(),
    ),
  );

  // get products cubit
  getIt.registerFactory<GetProductsCubit>(
    () => GetProductsCubit(
      getIt(),
    ),
  );

  // single category
  getIt.registerLazySingleton<SingleCategoryRepo>(
    () => SingleCategoryRepo(
      getIt(),
    ),
  );

  // get single category products cubit
  getIt.registerFactory<GetSingleCategoryCubit>(
    () => GetSingleCategoryCubit(
      getIt(),
    ),
  );

  // login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      FirebaseAuth.instance,
    ),
  );

  // login cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );
}

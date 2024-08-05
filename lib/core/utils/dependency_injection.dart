import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_final_project/core/utils/api_service.dart';
import 'package:iti_final_project/core/utils/cache_helper.dart';
import 'package:iti_final_project/core/utils/dio_setup.dart';
import 'package:iti_final_project/features/favourites/data/repo/favourites_repo.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/get_all_favourites/get_all_favourites_cubit.dart';
import 'package:iti_final_project/features/favourites/presentation/cubit/toggle_favourite/toggle_favourite_cubit.dart';
import 'package:iti_final_project/features/home/data/repo/home_repo.dart';
import 'package:iti_final_project/features/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:iti_final_project/features/layout/data/repo/layout_repo.dart';
import 'package:iti_final_project/features/layout/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:iti_final_project/features/login/data/repo/login_repo.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login/login_cubit.dart';
import 'package:iti_final_project/features/profile/data/repo/profile_repo.dart';
import 'package:iti_final_project/features/profile/presentation/cubit/get_profile_data/get_profile_data_cubit.dart';
import 'package:iti_final_project/features/profile/presentation/cubit/logout/logout_cubit.dart';
import 'package:iti_final_project/features/register/data/repo/register_repo.dart';
import 'package:iti_final_project/features/register/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:iti_final_project/features/register/presentation/cubit/register/register_cubit.dart';
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

  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
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
      getIt(),
    ),
  );

  // login cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );

  // register
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(
      getIt(),
      getIt(),
    ),
  );

  // register cubit
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      getIt(),
    ),
  );

  // create user cubit
  getIt.registerFactory<CreateUserCubit>(
    () => CreateUserCubit(
      getIt(),
    ),
  );

  // profile
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(
      getIt(),
      getIt(),
    ),
  );

  // get profile cubit
  getIt.registerFactory<GetProfileDataCubit>(
    () => GetProfileDataCubit(
      getIt(),
    ),
  );

  // logout cubit
  getIt.registerFactory<LogoutCubit>(
    () => LogoutCubit(
      getIt(),
    ),
  );

  // favourites
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(),
  );

  // favourite repo
  getIt.registerLazySingleton<FavouritesRepo>(
    () => FavouritesRepo(
      getIt(),
    ),
  );

  // get all favourites cubit
  getIt.registerFactory<GetAllFavouritesCubit>(
    () => GetAllFavouritesCubit(
      getIt(),
    ),
  );

  // toggle favourites cubit
  getIt.registerFactory<ToggleFavouriteCubit>(
    () => ToggleFavouriteCubit(
      getIt(),
    ),
  );
}

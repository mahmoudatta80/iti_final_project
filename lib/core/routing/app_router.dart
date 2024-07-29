import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/utils/dependency_injection.dart';
import 'package:iti_final_project/features/about/about_screen.dart';
import 'package:iti_final_project/features/carts/presentation/ui/carts_screen.dart';
import 'package:iti_final_project/features/contact_us/ui/contact_us_screen.dart';
import 'package:iti_final_project/features/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:iti_final_project/features/layout/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:iti_final_project/features/layout/presentation/ui/layout_screen.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login/login_cubit.dart';
import 'package:iti_final_project/features/login/presentation/ui/login_screen.dart';
import 'package:iti_final_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:iti_final_project/features/register/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:iti_final_project/features/register/presentation/cubit/register/register_cubit.dart';
import 'package:iti_final_project/features/register/presentation/ui/register_screen.dart';
import 'package:iti_final_project/features/single_category/presentation/cubit/get_single_category/get_single_category_cubit.dart';
import 'package:iti_final_project/features/single_category/presentation/ui/single_category_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CreateUserCubit>(),
              ),
            ],
            child: const RegisterScreen(),
          ),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetProductsCubit>()..getProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<GetCategoriesCubit>()..getCategories(),
              ),
            ],
            child: const LayoutScreen(),
          ),
        );
      case Routes.contactUsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case Routes.singleCategoryScreen:
        if (arguments is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<GetSingleCategoryCubit>()
                ..getSingleCategoryProducts(
                  arguments,
                ),
              child: const SingleCategoryScreen(),
            ),
          );
        }
      case Routes.cartsScreen:
        return MaterialPageRoute(
          builder: (_) => const CartsScreen(),
        );
      case Routes.aboutScreen:
        return MaterialPageRoute(
          builder: (_) => const AboutScreen(),
        );
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/features/about/about_screen.dart';
import 'package:iti_final_project/features/carts/presentation/ui/carts_screen.dart';
import 'package:iti_final_project/features/contact_us/ui/contact_us_screen.dart';
import 'package:iti_final_project/features/layout/ui/layout_screen.dart';
import 'package:iti_final_project/features/login/presentation/ui/login_screen.dart';
import 'package:iti_final_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:iti_final_project/features/register/presentation/ui/register_screen.dart';
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
          builder: (_) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.contactUsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case Routes.singleCategoryScreen:
        return MaterialPageRoute(
          builder: (_) => const SingleCategoryScreen(),
        );
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

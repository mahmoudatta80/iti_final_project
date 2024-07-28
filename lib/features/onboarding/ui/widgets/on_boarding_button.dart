import 'package:flutter/material.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';

class OnboardingButton extends StatelessWidget {
  final PageController pageController;

  const OnboardingButton({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.mainBlue,
      onPressed: () {
        if (pageController.page! < 2) {
          pageController.nextPage(
            duration: const Duration(
              milliseconds: 750,
            ),
            curve: Curves.ease,
          );
        } else {
          context.pushNamed(Routes.loginScreen);
        }
      },
      child: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.white,
      ),
    );
  }
}

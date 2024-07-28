import 'package:flutter/material.dart';
import 'package:iti_final_project/core/themes/my_assets.dart';
import 'package:iti_final_project/features/onboarding/models/onboarding_model.dart';
import 'package:iti_final_project/features/onboarding/ui/widgets/custom_page_view.dart';
import 'package:iti_final_project/features/onboarding/ui/widgets/on_boarding_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      image: MyAssets.firstOnboardingImage,
      title: 'Purchase Online !!',
      subTitle:
          'Lorem ipsum dolor sit amet, consecrate disciplining,sed do usermod temper ut labor',
    ),
    OnboardingModel(
      image: MyAssets.secondOnboardingImage,
      title: 'Track order !!',
      subTitle:
          'Lorem ipsum dolor sit amet, consecrate disciplining,sed do usermod temper ut labor',
    ),
    OnboardingModel(
      image: MyAssets.thirdOnboardingImage,
      title: 'Get your order !!',
      subTitle:
          'Lorem ipsum dolor sit amet, consecrate disciplining,sed do usermod temper ut labor',
    ),
  ];

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
        pageController: pageController,
        onboardingItems: onboardingItems,
      ),
      floatingActionButton: OnboardingButton(pageController: pageController),
    );
  }
}

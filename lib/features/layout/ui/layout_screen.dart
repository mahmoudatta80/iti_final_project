import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/features/categories/presentation/ui/categories_screen.dart';
import 'package:iti_final_project/features/home/presentation/ui/home_screen.dart';
import 'package:iti_final_project/features/layout/models/bottom_nav_bar_model.dart';
import 'package:iti_final_project/features/layout/ui/widgets/custom_bottom_nav_bar_item.dart';
import 'package:iti_final_project/features/profile/presentation/ui/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavBarModel> bottomNavBarItems = [
    BottomNavBarModel(
      icon: FontAwesomeIcons.house,
      text: 'Home',
    ),
    BottomNavBarModel(
      icon: FontAwesomeIcons.list,
      text: 'Categories',
    ),
    BottomNavBarModel(
      icon: FontAwesomeIcons.user,
      text: 'Profile',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            screen[currentIndex],
            Positioned(
              bottom: 20.h,
              right: 20.h,
              left: 20.h,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.mainBlue,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 30.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    bottomNavBarItems.length,
                    (index) => InkWell(
                      onTap: () {
                        currentIndex = index;
                        setState(() {});
                      },
                      child: CustomBottomNavBarItem(
                        bottomNavBarItems: bottomNavBarItems,
                        currentIndex: currentIndex,
                        index: index,
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

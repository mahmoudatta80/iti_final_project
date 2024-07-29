import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/layout/data/models/bottom_nav_bar_model.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final List<BottomNavBarModel> bottomNavBarItems;
  final int currentIndex;
  final int index;

  const CustomBottomNavBarItem({
    super.key,
    required this.bottomNavBarItems,
    required this.currentIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          bottomNavBarItems[index].icon,
          size: 20.sp,
          color: currentIndex == index ? Colors.white : Colors.grey,
        ),
        SizedBox(height: 5.h),
        Text(
          bottomNavBarItems[index].text,
          style: currentIndex == index
              ? MyStyles.font16BlackRegular.copyWith(
                  color: Colors.white,
                )
              : MyStyles.font16BlackRegular.copyWith(
                  color: Colors.grey,
                ),
        ),
      ],
    );
  }
}

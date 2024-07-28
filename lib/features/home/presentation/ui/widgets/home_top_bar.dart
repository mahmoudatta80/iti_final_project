import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Text(
            'Hello Mahmoud ..',
            style: MyStyles.font22BlackRegular,
          ),
          const Spacer(),
          FaIcon(
            FontAwesomeIcons.bell,
            color: MyColors.mainBlue,
            size: 28.sp,
          ),
        ],
      ),
    );
  }
}

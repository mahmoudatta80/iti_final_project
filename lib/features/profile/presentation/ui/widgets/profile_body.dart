import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: MyColors.mainBlue,
            child: Text(
              'M',
              style: MyStyles.font35WhiteBold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Mahmoud Atta',
            style: MyStyles.font22BlackRegular,
          ),
          SizedBox(height: 40.h),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.cartsScreen);
            },
            title: Text(
              'Carts',
              style: MyStyles.font20BlackRegular,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.black,
            ),
            contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.contactUsScreen);
            },
            title: Text(
              'Contact Us',
              style: MyStyles.font20BlackRegular,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.black,
            ),
            contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
          ),
          const CustomDivider(),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.aboutScreen);
            },
            title: Text(
              'About',
              style: MyStyles.font20BlackRegular,
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.black,
            ),
            contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}

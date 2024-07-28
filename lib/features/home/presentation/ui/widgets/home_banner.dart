import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_assets.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/utils/url_launcher_service.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.mainBlue,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover \nour site here',
                    style: MyStyles.font20WhiteSemiBold,
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: CustomTextButton(
                      text: 'Go for Dummy !!',
                      backgroundColor: Colors.white,
                      onPressed: () {
                        UrlLauncherService.launchCustomUrl(
                          'https://dummyjson.com/',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                MyAssets.homeBannerImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

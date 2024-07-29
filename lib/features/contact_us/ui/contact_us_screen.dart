import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_assets.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/utils/url_launcher_service.dart';
import 'package:iti_final_project/features/contact_us/models/developer_model.dart';
import 'package:iti_final_project/features/contact_us/ui/widgets/contact_us_tap_bar.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  List<DeveloperModel> developers = [
    DeveloperModel(
      name: 'Osama Rizk',
      image: MyAssets.osamaImage,
      linkedin: 'https://www.linkedin.com/in/osama-morizk',
      facebook: 'https://www.facebook.com/osama.mrizk.7',
    ),
    DeveloperModel(
      name: 'Mahmoud Atta',
      image: MyAssets.mahmoudImage,
      linkedin: 'https://www.linkedin.com/in/mahmoud-atta-a54b8624a',
      facebook: 'https://www.facebook.com/MAhmoudAtta02',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const ContactUsTapBar(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: 60.h,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          developers[index].image,
                          fit: BoxFit.fill,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            developers[index].name,
                            style: MyStyles.font20BlackRegular,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 20.w),
                          GestureDetector(
                            onTap: () {
                              UrlLauncherService.launchCustomUrl(
                                  developers[index].linkedin);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: MyColors.mainBlue,
                              size: 40.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              UrlLauncherService.launchCustomUrl(
                                  developers[index].facebook);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: MyColors.mainBlue,
                              size: 40.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                itemCount: developers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

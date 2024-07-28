import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Carts',
                      style: MyStyles.font22BlackRegular,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Project Overview : ',
                style: MyStyles.font20MainBlueSemiBold,
              ),
              SizedBox(height: 20.h),
              Text(
                'This application demonstrates the skills and knowledge I gained during my training. It features [briefly describe the key features of your app, such as user authentication, data management, integration with APIs, etc.].',
                style: MyStyles.font18BlackRegular,
              ),
              SizedBox(height: 15.h),
              Text(
                'I am grateful for the opportunity to participate in this training program and am excited to continue building upon the foundation it has provided. I hope this application showcases my growth as a developer and my ability to create functional and user-friendly software solutions.',
                style: MyStyles.font18BlackRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

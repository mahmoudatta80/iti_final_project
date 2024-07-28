import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/login/presentation/ui/widgets/dont_have_an_account.dart';
import 'package:iti_final_project/features/login/presentation/ui/widgets/build_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  'Login Here',
                  style: MyStyles.font35MainBlueBold,
                ),
                SizedBox(height: 26.h),
                Text(
                  'Welcome back you’ve been missed!',
                  style: MyStyles.font18BlackRegular,
                ),
                SizedBox(height: 74.h),
                const BuildLoginForm(),
                SizedBox(height: 30.h),
                const DontHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

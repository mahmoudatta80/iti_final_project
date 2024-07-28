import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';
import 'package:iti_final_project/core/widgets/custom_text_form_field.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({super.key});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  bool passwordIsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          text: 'User Name',
        ),
        SizedBox(height: 29.h),
        CustomTextFormField(
          text: 'Password',
          obscureText: !passwordIsVisible,
          suffixIcon: GestureDetector(
            onTap: () {
              passwordIsVisible = !passwordIsVisible;
              setState(() {});
            },
            child: Icon(
              !passwordIsVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: MyColors.mainBlue,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            'Forgot Your Password ?',
            style: MyStyles.font14MainBlueSemiBold,
          ),
        ),
        SizedBox(height: 30.h),
        CustomTextButton(
          text: 'Login',
          onPressed: () {
            context.pushNamed(Routes.layoutScreen);
          },
        ),
      ],
    );
  }
}

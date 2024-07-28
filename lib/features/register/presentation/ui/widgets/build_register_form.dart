import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';
import 'package:iti_final_project/core/widgets/custom_text_form_field.dart';

class BuildRegisterForm extends StatefulWidget {
  const BuildRegisterForm({super.key});

  @override
  State<BuildRegisterForm> createState() => _BuildRegisterFormState();
}

class _BuildRegisterFormState extends State<BuildRegisterForm> {
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
        SizedBox(height: 29.h),
        CustomTextFormField(
          text: 'Confirm Password',
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
        SizedBox(height: 53.h),
        CustomTextButton(
          text: 'Register',
          onPressed: () {
            context.pushNamed(Routes.layoutScreen);
          },
        ),
      ],
    );
  }
}

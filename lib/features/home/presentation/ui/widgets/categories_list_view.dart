import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.pushNamed(Routes.singleCategoryScreen);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            margin: EdgeInsetsDirectional.only(end: 20.w, bottom: 10.h),
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Center(
              child: Text(
                'Beauty',
                style: MyStyles.font18BlackRegular,
              ),
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}

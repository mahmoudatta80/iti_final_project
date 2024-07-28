import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        // ToDo i'll make a condition if it was a last item i'll add a sized box or padding at the bottom
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            context.pushNamed(Routes.singleCategoryScreen);
          },
          title: Text(
            'Fragrances',
            style: MyStyles.font20BlackRegular,
          ),
          trailing: const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.black,
          ),
          contentPadding:
              EdgeInsetsDirectional.symmetric(vertical: 10.h, horizontal: 20.w),
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: const CustomDivider(),
        ),
        itemCount: 20,
      ),
    );
  }
}

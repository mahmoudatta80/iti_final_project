import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/home/presentation/ui/widgets/categories_list_view.dart';
import 'package:iti_final_project/features/home/presentation/ui/widgets/home_banner.dart';
import 'package:iti_final_project/features/home/presentation/ui/widgets/products_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeBanner(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Text(
            'Categories',
            style: MyStyles.font22BlackBold,
          ),
        ),
        const CategoriesListView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Text(
            'Products',
            style: MyStyles.font22BlackBold,
          ),
        ),
        const ProductsListView(),
        SizedBox(height: 80.h),
      ],
    );
  }
}

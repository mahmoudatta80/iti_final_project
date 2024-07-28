import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';
import 'package:iti_final_project/features/single_category/presentation/ui/widgets/single_category_item.dart';

class SingleCategoryListView extends StatefulWidget {
  const SingleCategoryListView({super.key});

  @override
  State<SingleCategoryListView> createState() => _SingleCategoryListViewState();
}

class _SingleCategoryListViewState extends State<SingleCategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const SingleCategoryItem(),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: const CustomDivider(),
        ),
        itemCount: 10,
      ),
    );
  }
}

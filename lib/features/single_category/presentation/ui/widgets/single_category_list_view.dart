import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';
import 'package:iti_final_project/features/single_category/presentation/cubit/get_single_category/get_single_category_cubit.dart';
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
      child: BlocBuilder<GetSingleCategoryCubit, GetSingleCategoryState>(
        builder: (context, state) {
          if (state is GetSingleCategorySuccess) {
            return ListView.separated(
              itemBuilder: (context, index) => SingleCategoryItem(
                productModel: state.singleCategoryProducts[index],
              ),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: const CustomDivider(),
              ),
              itemCount: state.singleCategoryProducts.length,
            );
          } else if (state is GetSingleCategoryFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: MyStyles.font22BlackRegular,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.mainBlue,
              ),
            );
          }
        },
      ),
    );
  }
}

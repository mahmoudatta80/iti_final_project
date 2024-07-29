import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/features/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsetsDirectional.only(
                bottom: 20.h,
                start: 20.w,
                end: 20.w,
              ),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: state.products[index].images,
                    fit: BoxFit.fill,
                    height: 120.h,
                    width: 120.h,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.products[index].title,
                          style: MyStyles.font18BlackSemiBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          state.products[index].description,
                          style: MyStyles.font14BlackRegular,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            itemCount: state.products.length,
          );
        } else if (state is GetProductsFailure) {
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
    );
  }
}

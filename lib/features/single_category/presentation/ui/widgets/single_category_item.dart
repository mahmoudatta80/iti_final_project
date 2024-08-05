import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:iti_final_project/core/widgets/custom_material_button.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/single_category/presentation/ui/widgets/favourite_button_bloc_consumer.dart';

class SingleCategoryItem extends StatelessWidget {
  final ProductModel productModel;

  const SingleCategoryItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        bottom: 20.h,
        start: 20.w,
        end: 20.w,
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.image,
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
                  productModel.title,
                  style: MyStyles.font18BlackSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  '\$ ${productModel.price}',
                  style: MyStyles.font22BlackRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    CustomMaterialButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.minus,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '1',
                      style: MyStyles.font22BlackRegular,
                    ),
                    SizedBox(width: 10.w),
                    CustomMaterialButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.plus,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              FavouriteButtonBlocConsumer(productModel: productModel),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  CustomToasts.showErrorToast(
                    errorMessage: 'Cart will be active soon',
                  );
                },
                child: FaIcon(
                  FontAwesomeIcons.cartPlus,
                  color: MyColors.mainBlue,
                  size: 30.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

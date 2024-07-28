import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_material_button.dart';

class SingleCategoryItem extends StatelessWidget {
  const SingleCategoryItem({super.key});

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
            imageUrl:
                'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
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
                  'Essence Mascara Lash Princess',
                  style: MyStyles.font18BlackSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  '\$ 100',
                  style: MyStyles.font22BlackRegular,
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
          FaIcon(
            FontAwesomeIcons.cartPlus,
            color: MyColors.mainBlue,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}

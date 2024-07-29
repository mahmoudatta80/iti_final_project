import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';
import 'package:iti_final_project/features/layout/presentation/cubit/get_categories/get_categories_cubit.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  context.pushNamed(Routes.singleCategoryScreen);
                },
                title: Text(
                  state.categories[index].name,
                  style: MyStyles.font20BlackRegular,
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsetsDirectional.only(
                  start: 20.w,
                  end: 20.w,
                  top: 10.h,
                  bottom: index == (state.categories.length - 1) ? 100.h : 10.h,
                ),
              ),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: const CustomDivider(),
              ),
              itemCount: state.categories.length,
            );
          } else if (state is GetCategoriesFailure) {
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

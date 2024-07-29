import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';
import 'package:iti_final_project/core/themes/my_styles.dart';
import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:iti_final_project/core/widgets/custom_divider.dart';
import 'package:iti_final_project/features/profile/presentation/cubit/get_profile_data/get_profile_data_cubit.dart';
import 'package:iti_final_project/features/profile/presentation/ui/widgets/logout_field.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
        builder: (context, state) {
          if (state is GetProfileDataSuccess) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: MyColors.mainBlue,
                  child: Text(
                    state.userModel.userName[0],
                    style: MyStyles.font35WhiteBold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  state.userModel.userName,
                  style: MyStyles.font22BlackRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  state.userModel.email,
                  style: MyStyles.font18BlackRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 40.h),
                ListTile(
                  onTap: () {
                    CustomToasts.showErrorToast(
                      errorMessage: 'Cart will be active soon',
                    );
                    context.pushNamed(Routes.cartsScreen);
                  },
                  title: Text(
                    'Carts',
                    style: MyStyles.font20BlackRegular,
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                ),
                const CustomDivider(),
                ListTile(
                  onTap: () {
                    context.pushNamed(Routes.contactUsScreen);
                  },
                  title: Text(
                    'Contact Us',
                    style: MyStyles.font20BlackRegular,
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                ),
                const CustomDivider(),
                ListTile(
                  onTap: () {
                    context.pushNamed(Routes.aboutScreen);
                  },
                  title: Text(
                    'About',
                    style: MyStyles.font20BlackRegular,
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                ),
                const CustomDivider(),
                const LogoutField(),
              ],
            );
          } else if (state is GetProfileDataFailure) {
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

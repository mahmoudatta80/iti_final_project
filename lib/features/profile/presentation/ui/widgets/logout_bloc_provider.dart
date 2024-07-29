import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/utils/constant.dart';
import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:iti_final_project/core/utils/dependency_injection.dart';
import 'package:iti_final_project/core/utils/shared_preferences.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';
import 'package:iti_final_project/features/profile/presentation/cubit/logout/logout_cubit.dart';

class LogoutBlocProvider extends StatelessWidget {
  const LogoutBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocProvider(
      create: (context) => getIt.get<LogoutCubit>(),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutLoading) {
            requestLoading = true;
          } else if (state is LogoutSuccess) {
            Constants.token = '';
            MySharedPreferences.delete('token');
            CustomToasts.showSuccessToast(
              successMessage: 'Logout done successfully',
            );
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (route) => false,
            );
            requestLoading = false;
          } else if (state is LogoutFailure) {
            CustomToasts.showErrorToast(
              errorMessage: state.errorMessage,
            );
            requestLoading = false;
          }
        },
        builder: (context, state) {
          return CustomTextButton(
            text: 'Logout',
            requestLoading: requestLoading,
            onPressed: () {
              context.read<LogoutCubit>().logout();
            },
          );
        },
      ),
    );
  }
}

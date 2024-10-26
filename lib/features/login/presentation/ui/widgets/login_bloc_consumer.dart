import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CustomToasts.showSuccessToast(
            successMessage: 'Login done successfully',
          );
          context.pushNamedAndRemoveUntil(
            Routes.layoutScreen,
            predicate: (route) => false,
          );
        } else if (state is LoginFailure) {
          CustomToasts.showErrorToast(
            errorMessage: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Login',
          requestLoading: state is LoginLoading ? true : false,
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login();
            }
          },
        );
      },
    );
  }
}

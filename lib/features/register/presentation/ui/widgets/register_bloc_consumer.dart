import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/routing/extensions.dart';
import 'package:iti_final_project/core/routing/routes.dart';
import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:iti_final_project/core/widgets/custom_text_button.dart';
import 'package:iti_final_project/features/register/presentation/cubit/register/register_cubit.dart';
import 'package:iti_final_project/features/register/presentation/cubit/register/register_state.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          CustomToasts.showSuccessToast(
            successMessage: 'Register done successfully',
          );
          context.pushNamedAndRemoveUntil(
            Routes.layoutScreen,
            predicate: (route) => false,
          );
        } else if (state is RegisterFailure) {
          CustomToasts.showErrorToast(
            errorMessage: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Register',
          requestLoading: state is RegisterLoading ? true : false,
          onPressed: () {
            if (context
                .read<RegisterCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<RegisterCubit>().register();
            }
          },
        );
      },
    );
  }
}

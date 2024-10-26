import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/features/login/data/models/login_request_model.dart';
import 'package:iti_final_project/features/login/data/repo/login_repo.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login() async {
    emit(LoginLoading());
    final response = await loginRepo.login(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userCredential) {
        saveToken(userCredential.user!.uid);
        emit(LoginSuccess());
      },
    );
  }

  saveToken(String token) {
    Constants.token = token;
    MySharedPreferences.setString('token', token);
  }
}

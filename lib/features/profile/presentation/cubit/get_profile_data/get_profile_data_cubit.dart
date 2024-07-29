import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/utils/constant.dart';
import 'package:iti_final_project/features/profile/data/models/user_model.dart';
import 'package:iti_final_project/features/profile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  final ProfileRepo profileRepo;

  GetProfileDataCubit(this.profileRepo) : super(GetProfileDataInitial());

  Future getProfileData() async {
    emit(GetProfileDataLoading());

    final response = await profileRepo.getProfileData(Constants.token);

    response.fold(
      (failure) => emit(GetProfileDataFailure(failure.message)),
      (userModel) => emit(GetProfileDataSuccess(userModel)),
    );
  }
}

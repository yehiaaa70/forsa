import 'package:bloc/bloc.dart';
import 'package:forsa/core/models/auth_model.dart';
import 'package:forsa/core/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
    getUserData();
  }

  AuthModel? authModel;

  bool isCompany = false;
  String profilePhoto = '';

  getUserData() async {
    emit(ProfileUserDataLoading());
    authModel = await Preferences.instance.getUserModel();
    if (authModel != null) {
      if (authModel!.role == 'Company') {
        isCompany = true;
        profilePhoto = authModel!.company!.logo!;
      }else{
        isCompany = false;
        profilePhoto = authModel!.employee!.photo!;

      }
    }
    emit(ProfileUserDataLoaded());
  }
}

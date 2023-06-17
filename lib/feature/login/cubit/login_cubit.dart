import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:forsa/core/preferences/preferences.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../core/remote/service.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/dialogs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());

  final ServiceApi api;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRequestDone = true;

  authLogin() async {
    loadingDialog();
    isRequestDone = false;
    emit(LoginAuthLoading());
    final response =
        await api.authLogin(emailController.text, passwordController.text);
    response.fold(
      (l) {
        isRequestDone = true;
        Get.back();
        emit(LoginAuthError());
      },
      (r) {
        Get.back();
        isRequestDone = true;
        r.phone = emailController.text;
        if (r.isAuthenticated == true) {
          if (r.id == 0) {
            if(r.role=='Company'){
            successGetBar(r.message!);
            Preferences.instance.setUser(r);
            Get.toNamed(
              Routes.completeRegisterRoute,
              // (route) => false,
            );}else{
              successGetBar(r.message!);
              Preferences.instance.setUser(r);
              Get.toNamed(
                Routes.completeEmployeeRegisterRoute,
                // (route) => false,
              );
            }
          } else {
            successGetBar(r.message!);
            Preferences.instance.setUser(r);
            Get.offNamedUntil(
              Routes.navigationBottomRoute,
              (route) => false,
            );
          }
        } else {
          errorGetBar(r.message!);
        }
        emit(LoginAuthLoaded());
      },
    );
  }
}

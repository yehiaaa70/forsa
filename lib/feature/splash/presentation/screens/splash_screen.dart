import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/utils/assets_manager.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/auth_model.dart';
import '../../../../core/preferences/preferences.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../language/screens/choose_language.dart';
import '../../../register/cubit/register_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() {
    _getStoreUser();
  }

  _startDelay() async {
    _timer = Timer(
      const Duration(seconds: 2),
      () async {
        AuthModel model = await Preferences.instance.getUserModel();
        // Preferences.instance.clearUserData();
        print(model.toJson());


        _goNext();
      },
    );
  }

  _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthModel authModel = await Preferences.instance.getUserModel();

    if (prefs.getString(AppStrings.locale) != null) {
      if (prefs.getString('user') != null) {
        if (authModel.id == 0||authModel.id == null) {
          if (authModel.role == 'Company') {
            Get.offNamedUntil(
              Routes.completeRegisterRoute,
              (route) => false,
            );
          } else {
            Get.offNamedUntil(
              Routes.completeEmployeeRegisterRoute,
              (route) => false,
            );
          }
        } else {
          Get.offNamedUntil(
            Routes.navigationBottomRoute,
            (route) => false,
          );
        }
      } else {
        Get.offNamedUntil(
          Routes.chooseUserRoute,
          (route) => false,
        );
      }
    } else {
      Get.offNamed(
        Routes.chooseLanguageRoute,
      );
    }

    // Navigator.pushReplacement(
    //   context,
    //   PageTransition(
    //     type: PageTransitionType.fade,
    //     alignment: Alignment.center,
    //     duration: const Duration(milliseconds: 1300),
    //     child: const ChooseLanguageScreen(),
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    // context.read<RegisterCubit>().getCitiesData();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(ImageAssets.logoImage),
            ),
          ),
        ),
      ),
    );
  }
}

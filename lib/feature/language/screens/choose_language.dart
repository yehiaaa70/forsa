import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/preferences/preferences.dart';
import 'package:forsa/core/utils/assets_manager.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.scaffoldBackground,
      body: Container(
        decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.linearColors,
            ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: MediaQuery.of(context).size.height / 8),
              ),
              Hero(
                tag: 'logo',
                child: Image.asset(ImageAssets.logoImage),
              ),
              const SizedBox(height: 20),
              Text(
                'choose_language'.tr(),
                style: const TextStyle(fontSize: 35),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  EasyLocalization.of(context)!.setLocale(const Locale('ar'));
                  Preferences.instance.savedLang('ar');
                  Navigator.pushReplacementNamed(context, Routes.chooseUserRoute);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        'عربى',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  EasyLocalization.of(context)!.setLocale(const Locale('en'));
                  Preferences.instance.savedLang('en');
                  Navigator.pushReplacementNamed(context, Routes.chooseUserRoute);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Center(
                        child: Text(
                      'English',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

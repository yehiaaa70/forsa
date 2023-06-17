// import 'package:forsa/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:forsa/core/utils/app_colors.dart';
import 'package:get/get.dart';
import 'core/preferences/preferences.dart';
import 'core/routes/app_routes.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:forsa/injector.dart' as injector;

import 'feature/login/cubit/login_cubit.dart';
import 'feature/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'feature/profile/cubit/profile_cubit.dart';
import 'feature/register/cubit/register_cubit.dart';
import 'feature/splash/presentation/cubit/splash_cubit.dart';

class Forsa extends StatefulWidget {
  const Forsa({Key? key}) : super(key: key);

  @override
  State<Forsa> createState() => _ForsaState();
}

class _ForsaState extends State<Forsa> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(statusBarColor: AppColors.primary.withOpacity(0.8)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Preferences.instance.savedLang(
      EasyLocalization.of(context)!.locale.languageCode,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.serviceLocator<SplashCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<NavigatorBottomCubit>(),
        ),
       BlocProvider(
          create: (_) => injector.serviceLocator<LoginCubit>(),
        ),
      BlocProvider(
          create: (_) => injector.serviceLocator<RegisterCubit>(),
        ),
      BlocProvider(
          create: (_) => injector.serviceLocator<ProfileCubit>(),
        ),
      ],
      child: GetMaterialApp(
        theme: appTheme(),        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

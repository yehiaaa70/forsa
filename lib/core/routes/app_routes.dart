import 'package:flutter/material.dart';
import 'package:forsa/feature/choose_user/screen/choose_user.dart';
import 'package:forsa/feature/language/screens/choose_language.dart';
import 'package:forsa/feature/register/screens/complete_register.dart';
import 'package:forsa/feature/register/screens/register_screen.dart';

import '../../feature/login/screens/login.dart';
import '../../feature/navigation_bottom/screens/navigation_bottom.dart';
import '../../feature/register/screens/complete_employee_register.dart';
import '../../feature/verification_code/screens/forget_password.dart';
import '../../feature/verification_code/screens/new_password.dart';
import '../../feature/verification_code/screens/otp_screen.dart';
import '../utils/app_strings.dart';
import '../../feature/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String chooseLanguageRoute = '/chooseLanguage';
  static const String chooseUserRoute = '/chooseUser';
  static const String loginScreenRoute = '/loginScreen';
  static const String registerScreenRoute = '/registerScreen';
  static const String forgetScreenRoute = '/forgetScreen';
  static const String otpScreenRoute = '/otpScreen';
  static const String newPasswordScreenRoute = '/newPasswordScreen';
  static const String navigationBottomRoute = '/navigationBottom';
  static const String completeRegisterRoute = '/completeRegister';
  static const String completeEmployeeRegisterRoute = '/completeEmployeeRegister';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case Routes.completeRegisterRoute:
        return MaterialPageRoute(
          builder: (context) => CompleteRegisterScreen(),
        );
      case Routes.completeEmployeeRegisterRoute:
        return MaterialPageRoute(
          builder: (context) => CompleteEmployeeRegisterScreen(),
        );
      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case Routes.forgetScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case Routes.otpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => OTPScreen(),
        );
      case Routes.newPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => NewPasswordScreen(),
        );
      case Routes.navigationBottomRoute:
        return PageRouteBuilder(
          // builder: (context) => const ChooseUserScreen(),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const NavigationBottom(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case Routes.chooseUserRoute:
        return PageRouteBuilder(
          // builder: (context) => const ChooseUserScreen(),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const ChooseUserScreen(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case Routes.chooseLanguageRoute:
        return PageRouteBuilder(
          // builder: (context) => const ChooseUserScreen(),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const ChooseLanguageScreen(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}

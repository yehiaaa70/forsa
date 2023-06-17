import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/widgets/custom_textfield.dart';
import 'package:lottie/lottie.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/widgets/back_widget.dart';
import '../../../core/widgets/custom_button.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          LoginCubit cubit = context.read<LoginCubit>();
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.linearColors,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Hero(
                                tag: 'loginBack',
                                child: BackWidget(size: 50),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Hero(
                                tag: 'loginLogo',
                                child: Image.asset(
                                  ImageAssets.logoImage,
                                  height: 180,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        CustomTextField(
                          title: 'phone'.tr(),
                          enable: cubit.isRequestDone,
                          textInputType: TextInputType.phone,
                          image: ImageAssets.phoneIcon,
                          controller: cubit.emailController,
                          validatorMessage: 'phone_valid'.tr(),
                        ),
                        const SizedBox(height: 22),
                        CustomTextField(
                          title: 'password'.tr(),
                          enable: cubit.isRequestDone,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                          image: ImageAssets.lockIcon,
                          controller: cubit.passwordController,
                          validatorMessage: 'password_valid'.tr(),
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: 'login'.tr(),
                          color: AppColors.primary,
                          paddingHorizontal: 50,
                          onClick: cubit.isRequestDone
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.authLogin();
                                    // Get.
                                    // Navigator.pushNamedAndRemoveUntil(
                                    //   context,
                                    //   Routes.navigationBottomRoute,
                                    //   (route) => false,
                                    // );
                                  }
                                }
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.registerScreenRoute,
                                  );
                                },
                                child: Text(
                                  'new_register'.tr(),
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.forgetScreenRoute,
                                  );
                                },
                                child: Text(
                                  'forget_password'.tr(),
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/back_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'new_password'.tr(),
                          style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 22,),
                        ),
                      ),
                      const Hero(
                        tag: 'loginBack',
                        child: BackWidget(size: 40),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          ImageAssets.newPasswordImage,
                          width: 210,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Text('new_password_title'.tr()),
                  const SizedBox(height: 32),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'password'.tr(),
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                    image: ImageAssets.lockIcon,
                    controller: passwordController,
                    validatorMessage: 'password_valid'.tr(),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'confirm_password'.tr(),
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                    image: ImageAssets.lockIcon,
                    controller: confirmPasswordController,
                    validatorMessage: 'password_valid'.tr(),
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                    paddingHorizontal: 65,
                    text: 'done'.tr(),
                    color: AppColors.primary,
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

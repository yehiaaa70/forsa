import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/back_widget.dart';
import '../widgets/header_title.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),

        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'forget_password'.tr(),
                        style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 22,),
                      ),
                    ),
                     const Hero(
                      tag: 'loginBack',
                      child: BackWidget(size: 40),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      HeaderTitleWidget(
                        title: 'forget_password_title'.tr(),
                        des: 'forget_password_desc'.tr(),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        title: 'phone'.tr(),
                        textInputType: TextInputType.phone,
                        image: ImageAssets.phoneIcon,
                        // controller: emailController,
                        validatorMessage: 'phone_valid'.tr(),
                      ),
                      const SizedBox(height: 60),
                      CustomButton(
                        text: 'send'.tr(),
                        color: AppColors.primary,
                        paddingHorizontal: 60,
                        onClick: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, Routes.otpScreenRoute);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    ImageAssets.forgetPasswordImage,
                    height: 180,
                    width: MediaQuery.of(context).size.width / 2 + 80,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

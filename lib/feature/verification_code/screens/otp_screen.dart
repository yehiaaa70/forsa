import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/routes/app_routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../core/widgets/back_widget.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/header_title.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  @override
  void initState() {
    super.initState();
    // if(context.read<RegisterCubit>().phone.isNotEmpty){
    // context.read<RegisterCubit>().startTimer();
    // }
  }

  @override
  void dispose() {
    errorController!.close();
    // textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    errorController = StreamController<ErrorAnimationType>();
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'otp_text'.tr(),
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
                    const SizedBox(height: 80),
                    HeaderTitleWidget(
                      title: 'reset_password_title'.tr(),
                      des: 'reset_password_desc'.tr(),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          hintCharacter: '0',
                          pastedTextStyle: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                          appContext: context,
                          length: 6,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 5) {
                              return "";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            inactiveColor: AppColors.gray,
                            activeColor: AppColors.gray,
                            shape: PinCodeFieldShape.underline,
                            selectedColor: AppColors.primary,
                          ),
                          cursorColor: AppColors.primary,
                          animationDuration:
                          const Duration(milliseconds: 300),
                          errorAnimationController: errorController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        hasError
                            ? 'reset_password_validator_message'.tr()
                            : "",
                        style: TextStyle(
                            color: AppColors.error,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'done'.tr(),
                      color: AppColors.primary,
                      paddingHorizontal: 60,
                      onClick: () {
                        formKey.currentState!.validate();
                        if (currentText.length != 6) {
                          errorController!.add(
                            ErrorAnimationType.shake,
                          ); // Triggering error shake animation
                          setState(() => hasError = true);
                        } else {
                          setState(
                                () {
                              hasError = false;
                              Navigator.pushReplacementNamed(context, Routes.newPasswordScreenRoute);
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  ImageAssets.resetPasswordImage,
                  height: 180,
                  width: 210,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

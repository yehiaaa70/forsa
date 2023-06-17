import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/utils/app_colors.dart';
import 'package:forsa/core/utils/assets_manager.dart';
import 'package:forsa/core/utils/dialogs.dart';
import 'package:forsa/core/widgets/back_widget.dart';
import 'package:forsa/core/widgets/custom_button.dart';

import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/dropdown_search.dart';
import '../cubit/register_cubit.dart';
import '../widgets/privacy_check_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5; // 1.0 means normal animation speed.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          RegisterCubit cubit = context.read<RegisterCubit>();
          return Form(
            key: formKey,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.linearColors,
                ),
              ),
              child: SafeArea(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: 'loginLogo',
                          child: Image.asset(
                            ImageAssets.logoImage,
                            width: 100,
                            height: 80,
                          ),
                        ),
                        const Hero(
                          tag: 'loginBack',
                          child: BackWidget(size: 40),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      title: 'username'.tr(),
                      textInputType: TextInputType.text,
                      image: ImageAssets.userIcon,
                      controller: cubit.usernameController,
                      validatorMessage: 'username_valid'.tr(),
                    ),
                    const SizedBox(height: 22),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.emailAddress,
                      image: ImageAssets.emailIcon,
                      controller: cubit.emailController,
                      validatorMessage: 'email_valid'.tr(),
                    ),
                    const SizedBox(height: 22),
                    CustomTextField(
                      title: 'phone'.tr(),
                      textInputType: TextInputType.phone,
                      image: ImageAssets.phoneIcon,
                      controller: cubit.phoneController,
                      validatorMessage: 'phone_valid'.tr(),
                    ),
                    const SizedBox(height: 22),
                    CustomTextField(
                      title: 'password'.tr(),
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      image: ImageAssets.lockIcon,
                      controller: cubit.passwordController,
                      validatorMessage: 'password_valid'.tr(),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: DropdownSearchWidget(
                              icon: Icons.add_location_alt,
                              dropdownList: cubit.citiesList,
                              isEnable: cubit.citiesEnabled,
                              labelText: 'city'.tr(),
                              cubit: cubit,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: cubit.citiesIsLoading,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Visibility(
                          visible: cubit.citiesList.isEmpty &&
                              state is RegisterCitiesError,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () => cubit.getCitiesData(),
                              icon: Icon(
                                Icons.refresh,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: DropdownSearchWidget(
                              icon: Icons.person_search,
                              dropdownList: cubit.rolesList,
                              isEnable: cubit.rolesEnabled,
                              labelText: 'worker_search'.tr(),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: cubit.rolesIsLoading,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Visibility(
                          visible: cubit.rolesList.isEmpty &&
                              state is RegisterCitiesError,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () => cubit.getRolesData(),
                              icon: Icon(
                                Icons.refresh,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const PrivacyCheckWidget(),
                    const SizedBox(height: 60),
                    CustomButton(
                      text: 'new_register'.tr(),
                      color: AppColors.primary,
                      onClick: cubit.isRequestDone
                          ? () {
                              if (formKey.currentState!.validate()) {
                                if (cubit.cityId.isEmpty) {
                                  errorGetBar('من فضلك اختر المدينه');
                                } else if (cubit.roleId.isEmpty) {
                                  errorGetBar('من فضلك اختر نوع عملك');
                                } else {
                                  cubit.authRegister();
                                }
                              }
                            }
                          : null,
                      paddingHorizontal: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

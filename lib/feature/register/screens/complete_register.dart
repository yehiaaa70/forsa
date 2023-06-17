import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsa/core/widgets/show_loading_indicator.dart';
import 'package:forsa/feature/register/cubit/register_cubit.dart';
import 'package:forsa/feature/register/cubit/register_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/network_image.dart';
import '../widgets/change_profile_photo.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
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
              child: State is GetUserDataLoading
                  ? Center(child: ShowLoadingIndicator())
                  : SafeArea(
                      child: ListView(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 140,
                                    height: 140,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.white,
                                      child: ClipOval(
                                        child: cubit.imagePath.isEmpty
                                            ? Image.asset(
                                                ImageAssets.avatarImage)
                                            : Image.file(
                                                File(cubit.imagePath),
                                                width: 140.0,
                                                height: 140.0,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Text('change_photo'.tr()),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            content: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  60,
                                              child: Row(
                                                children: [
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<RegisterCubit>()
                                                          .pickImage(
                                                            type: 'camera',
                                                          );
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: SizedBox(
                                                      height: 80,
                                                      width: 80,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons.camera_alt,
                                                              size: 45,
                                                              color: AppColors
                                                                  .gray),
                                                          Text('camera')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<RegisterCubit>()
                                                          .pickImage(
                                                            type: 'photo',
                                                          );
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: SizedBox(
                                                      height: 80,
                                                      width: 80,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons.photo,
                                                              size: 45,
                                                              color: AppColors
                                                                  .gray),
                                                          Text('Gallery')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('cancel'.tr()),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          color: AppColors.primary,
                                        ),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text(
                                cubit.userName,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                          // Column(
                          //   children: [
                          //     SizedBox(
                          //       width: 120,
                          //       height: 120,
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(140),
                          //         child: Image.memory(
                          //           base64.decode(cubit.base64Image),
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          CustomTextField(
                            title: 'اسم المؤسسة',
                            textInputType: TextInputType.text,
                            image: ImageAssets.institutionIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeNameAr,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'Institution Name',
                            textInputType: TextInputType.text,
                            image: ImageAssets.institutionIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeNameEn,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'phone'.tr(),
                            textInputType: TextInputType.phone,
                            enable: false,
                            image: ImageAssets.phoneIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completePhone,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'whatsapp'.tr(),
                            textInputType: TextInputType.phone,
                            image: ImageAssets.whatsappIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeWhatsapp,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'email'.tr(),
                            textInputType: TextInputType.emailAddress,
                            image: ImageAssets.emailIcon,
                            fillColor: AppColors.white,
                            enable: false,
                            controller: cubit.completeEmail,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'city'.tr(),
                            textInputType: TextInputType.emailAddress,
                            image: ImageAssets.cityLocationIcon,
                            fillColor: AppColors.white,
                            enable: false,
                            controller: cubit.completeCity,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'desc'.tr(),
                            textInputType: TextInputType.emailAddress,
                            image: 'null',
                            fillColor: AppColors.white,
                            controller: cubit.completeDesc,
                            validatorMessage: 'fill_error'.tr(),
                            minLine: 5,
                          ),
                          SizedBox(height: 50),
                          CustomButton(
                            text: 'save_data'.tr(),
                            color: AppColors.primary,
                            onClick:
                            // cubit.isRequestDone
                            //     ?
                                () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.postNewCompany();
                                    }
                                  },
                                // : null,
                            paddingHorizontal: 50,
                          ),
                          SizedBox(height: 50),
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

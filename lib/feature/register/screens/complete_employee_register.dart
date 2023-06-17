import 'dart:convert';
import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:forsa/core/widgets/show_loading_indicator.dart';
import 'package:forsa/feature/register/cubit/register_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/dropdown_search.dart';
import '../../../core/widgets/network_image.dart';
import '../widgets/change_profile_photo.dart';

class CompleteEmployeeRegisterScreen extends StatefulWidget {
  const CompleteEmployeeRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CompleteEmployeeRegisterScreen> createState() =>
      _CompleteEmployeeRegisterScreenState();
}

class _CompleteEmployeeRegisterScreenState
    extends State<CompleteEmployeeRegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>().getUserData();
    context.read<RegisterCubit>().getCurrentJobStatusData();
    context.read<RegisterCubit>().getJobCategoriesData();
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
                                                ImageAssets.avatarImage,
                                              )
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
                              SizedBox(height: 30),
                            ],
                          ),
                          CustomTextField(
                            title: 'اسم المستخدم',
                            textInputType: TextInputType.text,
                            image: ImageAssets.userIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeEmployeeNameAr,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'Username',
                            textInputType: TextInputType.text,
                            image: ImageAssets.userIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeEmployeeNameEn,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'address'.tr(),
                            textInputType: TextInputType.text,
                            image: ImageAssets.cityLocationIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeEmployeeAddress,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              Spacer(),
                              InkWell(
                                  onTap: () async {
                                    BottomPicker.date(
                                      title: 'dateOfBirth'.tr(),
                                      titleStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blue),
                                      onChange: (index) {
                                        print(index);
                                      },
                                      onSubmit: (index) {
                                        setState(() {
                                          cubit.date =
                                              index.toString().substring(0, 10);
                                        });
                                        print(index);
                                      },
                                      bottomPickerTheme: BottomPickerTheme.blue,
                                    ).show(context);
                                  },
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: AppColors.primary,
                                    size: 30,
                                  )),
                              Spacer(),
                              InkWell(
                                  onTap: () async {
                                    BottomPicker.date(
                                      title: 'dateOfBirth'.tr(),
                                      titleStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blue),
                                      onChange: (index) {
                                        print(index);
                                      },
                                      onSubmit: (index) {
                                        setState(() {
                                          cubit.date =
                                              index.toString().substring(0, 10);
                                        });
                                        print(index);
                                      },
                                      bottomPickerTheme: BottomPickerTheme.blue,
                                    ).show(context);
                                  },
                                  child:
                                      Text(cubit.date ?? 'dateOfBirth'.tr())),
                              Spacer(),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: DropdownSearchWidget(
                                    icon: Icons.work_history_outlined,
                                    backgroundColor: AppColors.white,
                                    dropdownList: cubit.currentJobStatusList,
                                    isEnable: cubit.currentJobStatusEnabled,
                                    labelText: 'currentJobStatus'.tr(),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: cubit.currentJobStatusIsLoading,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              Visibility(
                                visible: cubit.currentJobStatusList.isEmpty &&
                                    state is RegisterCitiesError,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: IconButton(
                                    onPressed: () =>
                                        cubit.getCurrentJobStatusData(),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: DropdownSearchWidget(
                                    icon: Icons.category,
                                    backgroundColor: AppColors.white,
                                    dropdownList: cubit.jobCategoriesList,
                                    isEnable: cubit.jobCategoryEnabled,
                                    labelText: 'jobCategory'.tr(),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: cubit.jobCategoryIsLoading,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              Visibility(
                                visible: cubit.jobCategoriesList.isEmpty &&
                                    state is RegisterCitiesError,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: IconButton(
                                    onPressed: () =>
                                        cubit.getJobCategoriesData(),
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
                          CustomTextField(
                            title: 'whatsapp'.tr(),
                            textInputType: TextInputType.phone,
                            image: ImageAssets.whatsappIcon,
                            fillColor: AppColors.white,
                            controller: cubit.completeEmployeeWhatsapp,
                            validatorMessage: 'fill_error'.tr(),
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                            title: 'qualification'.tr(),
                            textInputType: TextInputType.text,
                            image: ImageAssets.qualificationIcon,
                            fillColor: AppColors.white,
                            // enable: false,
                            controller: cubit.completeEmployeeQualifications,
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
                                // cubit.isRequestDone ?
                                () {
                              if (formKey.currentState!.validate()) {
                                cubit.postNewEmployee();
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

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:forsa/core/models/auth_model.dart';
import 'package:forsa/core/preferences/preferences.dart';
import 'package:forsa/core/remote/service.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/dialogs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial()) {
    getCitiesData();
    getRolesData();
    // getCurrentJobStatusData();
    // getJobCategoriesData();
  }

  final ServiceApi api;

  List<String> citiesList = [];
  List<String> rolesList = [];
  List<String> currentJobStatusList = [];
  List<String> jobCategoriesList = [];

  bool citiesEnabled = false;
  bool citiesIsLoading = false;

  bool rolesEnabled = false;
  bool rolesIsLoading = false;

  bool currentJobStatusEnabled = false;
  bool currentJobStatusIsLoading = false;

  bool genderEnabled = false;
  bool genderIsLoading = false;

  bool jobCategoryEnabled = false;
  bool jobCategoryIsLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController completeNameAr = TextEditingController();
  TextEditingController completeNameEn = TextEditingController();
  TextEditingController completePhone = TextEditingController();
  TextEditingController completeWhatsapp = TextEditingController();
  TextEditingController completeEmail = TextEditingController();
  TextEditingController completeCity = TextEditingController();
  TextEditingController completeDesc = TextEditingController();

  TextEditingController completeEmployeeNameAr = TextEditingController();
  TextEditingController completeEmployeeNameEn = TextEditingController();
  TextEditingController completeEmployeeAddress = TextEditingController();
  TextEditingController completeEmployeePhone = TextEditingController();
  TextEditingController completeEmployeeWhatsapp = TextEditingController();
  TextEditingController completeEmployeeEmail = TextEditingController();
  TextEditingController completeEmployeeQualifications =
      TextEditingController();
  TextEditingController completeEmployeeDesc = TextEditingController();

  String? date;
  String cityId = '';
  String roleId = '';
  String currentJobStatusId = '';
  String jobCategoriesId = '';

  XFile? imageFile;
  String imagePath = '';

  XFile? suggestImageFile;
  String suggestImagePath = '';
  String userName = '';
  String base64Image = '';
  bool isRequestDone = true;

  getUserData() async {
    emit(GetUserDataLoading());
    AuthModel model = await Preferences.instance.getUserModel();
    completePhone.text = model.phone!;
    completeEmail.text = model.email!;
    completeCity.text = model.cityName!;
    userName = model.username!;
    emit(GetUserDataLoaded());
  }

  pickImage({required String type}) async {
    imageFile = await ImagePicker().pickImage(
      source: type == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 90,
    );
    imagePath = croppedFile!.path;
    Uint8List uint8list = await croppedFile.readAsBytes();
    // base64Image = base64.encode(uint8list);
    // final bytes = File(imagePath).readAsBytesSync();
    base64Image = "data:image/${imagePath.split('.').last};base64," +
        base64.encode(uint8list);
    print('base64Image ................................');
    print(base64Image);
    emit(PickImageSuccess());
  }

  authRegister() async {
    loadingDialog();
    isRequestDone = false;
    emit(RegisterNewLoading());
    final response = await api.authRegister(
      phoneController.text,
      passwordController.text,
      cityId.toString(),
      roleId.toString(),
      emailController.text,
      usernameController.text,
    );
    response.fold(
      (l) {
        isRequestDone = true;
        Get.back();

        emit(RegisterNewLoaded());
      },
      (r) {
        Get.back();
        isRequestDone = true;
        r.phone = phoneController.text;
        if (r.isAuthenticated == true) {
          if (r.id == 0) {
            if (r.role == 'Company') {
              successGetBar(r.message!);
              Preferences.instance.setUser(r);
              Get.toNamed(
                Routes.completeRegisterRoute,
                // (route) => false,
              );
            } else {
              successGetBar(r.message!);
              Preferences.instance.setUser(r);
              Get.toNamed(
                Routes.completeEmployeeRegisterRoute,
                // (route) => false,
              );
            }
          } else {
            successGetBar(r.message!);
            Preferences.instance.setUser(r);
            Get.offNamedUntil(
              Routes.navigationBottomRoute,
              (route) => false,
            );
          }
        } else {
          errorGetBar(r.message!);
        }
        emit(RegisterNewLoaded());
      },
    );
  }

  getCitiesData() async {
    citiesIsLoading = true;
    emit(RegisterCitiesLoading());
    final response = await api.citiesData();
    response.fold(
      (l) {
        citiesIsLoading = false;
        citiesEnabled = true;
        emit(RegisterCitiesError());
      },
      (r) {
        r.forEach((element) {
          citiesList.add('${element.name}/${element.id}');
        });
        citiesIsLoading = false;
        citiesEnabled = true;
        emit(RegisterCitiesLoaded());
      },
    );
  }

  getRolesData() async {
    rolesIsLoading = true;
    emit(RegisterCitiesLoading());
    final response = await api.rolesData();
    response.fold(
      (l) {
        rolesIsLoading = false;
        rolesEnabled = true;
        emit(RegisterCitiesError());
      },
      (r) {
        r.forEach((element) {
          rolesList.add('${element.name}/${element.id}');
        });
        rolesIsLoading = false;
        rolesEnabled = true;
        emit(RegisterCitiesLoaded());
      },
    );
  }

  getCurrentJobStatusData() async {
    currentJobStatusIsLoading = true;
    emit(RegisterCitiesLoading());
    final response = await api.CurrentJobStatusData();
    response.fold(
      (l) {
        currentJobStatusIsLoading = false;
        currentJobStatusEnabled = true;
        emit(RegisterCitiesError());
      },
      (r) {
        r.forEach((element) {
          currentJobStatusList.add('${element.name}/${element.id}');
        });
        currentJobStatusIsLoading = false;
        currentJobStatusEnabled = true;
        emit(RegisterCitiesLoaded());
      },
    );
  }

  getJobCategoriesData() async {
    jobCategoryIsLoading = true;
    emit(RegisterCitiesLoading());
    final response = await api.jobCategoryData();
    response.fold(
      (l) {
        jobCategoryIsLoading = false;
        jobCategoryEnabled = true;
        emit(RegisterCitiesError());
      },
      (r) {
        r.forEach((element) {
          jobCategoriesList.add('${element.name}/${element.id}');
        });
        jobCategoryIsLoading = false;
        jobCategoryEnabled = true;
        emit(RegisterCitiesLoaded());
      },
    );
  }

  postNewCompany() async {
    emit(RegisterCompleteLoading());
    loadingDialog();
    isRequestDone = false;
    final response = await api.postNewCompany(
      completeNameAr.text,
      completeNameEn.text,
      completeWhatsapp.text,
      base64Image,
      completeDesc.text,
    );
    response.fold(
      (l) {
        isRequestDone = true;
        Get.back();
        print('===================================');
        print(l.errorModel!.message!.value);
        errorGetBar(l.errorModel!.message!.value);
        // successGetBar(l.errorModel!.message!.value);
        emit(RegisterCompleteError());
      },
      (r) async {
        Get.back();
        isRequestDone = true;

        successGetBar('لقد تم اكمال البانات بنجاح');
        AuthModel authModel = await Preferences.instance.getUserModel();
        authModel.company = r;
        authModel.id = r.id;
        print(
            '0000000000000000000000000000000000000000000000000000000000000000000000');
        print(authModel.toJson());
        print(
            '0000000000000000000000000000000000000000000000000000000000000000000000');
        Preferences.instance.setUser(authModel);
        Get.offNamedUntil(
          Routes.navigationBottomRoute,
          (route) => false,
        );
        emit(RegisterCompleteLoaded());
      },
    );
  }

  postNewEmployee() async {
    emit(RegisterCompleteLoading());
    loadingDialog();
    isRequestDone = false;
    final response = await api.postNewEmployee(
      employeeName: completeEmployeeNameAr.text,
      employeeNameE: completeEmployeeNameEn.text,
      whatsAppNo: completeEmployeeWhatsapp.text,
      photo: base64Image,
      description: completeDesc.text,
      address: completeEmployeeAddress.text,
      currentJobStatusId: currentJobStatusId,
      jobCategoryId: jobCategoriesId,
      dateOfBirth: date!,
      qualifications: completeEmployeeQualifications.text,
    );
    response.fold(
      (l) {
        isRequestDone = true;
        Get.back();
        print('===================================');
        print(l.errorModel!.message!.value);
        errorGetBar(l.errorModel!.message!.value);
        emit(RegisterCompleteError());
      },
      (r) async {
        Get.back();
        isRequestDone = true;
        successGetBar('لقد تم اكمال البانات بنجاح');
        AuthModel authModel = await Preferences.instance.getUserModel();
        authModel.employee = r;
        authModel.id = r.id;
        Preferences.instance.setUser(authModel);
        Get.offNamedUntil(
          Routes.navigationBottomRoute,
          (route) => false,
        );
        emit(RegisterCompleteLoaded());
      },
    );
  }
}

import 'dart:convert';

import 'package:forsa/core/models/company_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_model.dart';
import '../models/employee_model.dart';
import '../utils/app_strings.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<String?> getFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('onBoarding');
    return jsonData;
  }

  Future<void> setUser(AuthModel authModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
      'user',
      jsonEncode(
        AuthModel.fromJson(
          authModel.toJson(),
        ),
      ),
    );
  }

  Future<AuthModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    AuthModel authModel;
    if (jsonData != null) {
      authModel = AuthModel.fromJson(jsonDecode(jsonData));
      // userModel.data?.isLoggedIn = true;
    } else {
      authModel = AuthModel();
    }
    return authModel;
  }

  Future<void> setCompanyModel(CompanyModel companyModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
      'userCompanyModel',
      jsonEncode(
        CompanyModel.fromJson(
          companyModel.toJson(),
        ),
      ),
    );
  }

  Future<CompanyModel> getCompanyModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('userCompanyModel');
    CompanyModel companyModel;
    if (jsonData != null) {
      companyModel = CompanyModel.fromJson(jsonDecode(jsonData));
      // userModel.data?.isLoggedIn = true;
    } else {
      companyModel = CompanyModel();
    }
    return companyModel;
  }

  Future<void> setEmployeeModel(EmployeeModel employeeModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
      'userEmployeeModel',
      jsonEncode(
        EmployeeModel.fromJson(
          employeeModel.toJson(),
        ),
      ),
    );
  }

  Future<EmployeeModel> getEmployeeModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('userEmployeeModel');
    EmployeeModel employeeModel;
    if (jsonData != null) {
      employeeModel = EmployeeModel.fromJson(jsonDecode(jsonData));
      // userModel.data?.isLoggedIn = true;
    } else {
      employeeModel = EmployeeModel();
    }
    return employeeModel;
  }


  Future<bool> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     preferences.remove(AppStrings.locale);
    return preferences.remove('user');
  }

  Future<String> getSavedLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(AppStrings.locale)!;
  }

  Future<void> savedLang(String local) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppStrings.locale, local);
  }

}

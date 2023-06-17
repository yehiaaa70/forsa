import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forsa/core/models/company_model.dart';
import 'package:forsa/core/models/employee_model.dart';
import 'package:forsa/core/models/error_model.dart';
import 'package:forsa/core/preferences/preferences.dart';
import 'package:forsa/core/utils/dialogs.dart';

import '../api/app_interceptors.dart';
import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../api/status_code.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/auth_model.dart';
import '../models/cities_model.dart';
import 'package:forsa/injector.dart' as injector;

class ServiceApi {
  final BaseApiConsumer dio;
  final Dio client;

  ServiceApi(this.dio, this.client) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..receiveTimeout = 2000 * 60
      ..connectTimeout = 2000 * 60
      ..sendTimeout = 2000 * 60
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(injector.serviceLocator<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(injector.serviceLocator<LogInterceptor>());
    }
  }

  Future<Either<Failure, AuthModel>> authLogin(
      String mobile, String password) async {
    try {
      final response = await dio.post(
        EndPoints.loginUrl,
        body: {
          'mobile': mobile,
          'password': password,
        },
      );
      print(response);
      return Right(AuthModel.fromJson(_handleResponseAsJson(response)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AuthModel>> authRegister(
    String mobile,
    String password,
    String cityId,
    String roleId,
    String email,
    String name,
  ) async {
    try {
      final response = await dio.post(
        EndPoints.registerUrl,
        body: {
          "cityId": cityId,
          "mobile": mobile,
          "password": password,
          "roleId": roleId,
          "userName": name,
          "emailAddress": email,
          "defaultLang": await Preferences.instance.getSavedLang(),
        },
      );
      print(response);
      return Right(AuthModel.fromJson(_handleResponseAsJson(response)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<CitiesModel>>> citiesData() async {
    String lan = await Preferences.instance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.citiesUrl,
        options: Options(
          headers: {
            'Accept-Language': lan == 'ar' ? "ar-EG" : lan,
          },
        ),
      );
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(response);
      List<CitiesModel>? model = [];
      map.forEach((element) {
        model.add(CitiesModel.fromJson(element));
      });
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<CitiesModel>>> rolesData() async {
    String lan = await Preferences.instance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.rolesUrl,
        options: Options(
          headers: {
            'Accept-Language': lan == 'ar' ? "ar-EG" : lan,
          },
        ),
      );
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(response);
      List<CitiesModel>? model = [];
      map.forEach((element) {
        model.add(CitiesModel.fromJson(element));
      });
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<CitiesModel>>> jobCategoryData() async {
    String lan = await Preferences.instance.getSavedLang();
    AuthModel authModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.jobCategoryUrl,
        options: Options(
          headers: {
            'Accept-Language': lan == 'ar' ? "ar-EG" : lan,
            'Authorization': 'Bearer ${authModel.token!}',
          },
        ),
      );
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(response);
      List<CitiesModel>? model = [];
      map.forEach((element) {
        model.add(CitiesModel.fromJson(element));
      });
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<CitiesModel>>> CurrentJobStatusData() async {
    String lan = await Preferences.instance.getSavedLang();
    AuthModel authModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.CurrentJobStatusUrl,
        options: Options(
          headers: {
            'Accept-Language': lan == 'ar' ? "ar-EG" : lan,
            'Authorization': 'Bearer ${authModel.token!}',
          },
        ),
      );
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(response);
      List<CitiesModel>? model = [];
      map.forEach((element) {
        model.add(CitiesModel.fromJson(element));
      });
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, EmployeeModel>> postNewEmployee({
    required String address,
    required String currentJobStatusId,
    required String dateOfBirth,
    required String employeeName,
    required String employeeNameE,
    required String jobCategoryId,
    required String whatsAppNo,
    required String photo,
    required String qualifications,
    required String description,
  }) async {
    AuthModel authModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(
        EndPoints.employeeUrl,
        body: {
          "address": address,
          "currentJobStatusId": currentJobStatusId,
          "dateOfBirth": dateOfBirth,
          "employeeName": employeeName,
          "employeeNameE": employeeNameE,
          "jobCategoryId": jobCategoryId,
          "userId": 0,
          "whatsAppNo": whatsAppNo,
          "id": 0,
          "photo": photo,
          "qualifications": qualifications,
          "description": description,
          "lastSearchText": "",
          "notifyMe": false,
          "genderId": 1,
          "nationalityId": 2,
          "residencyStatusId": 1
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${authModel.token!}',
          },
        ),
      );
      return response.statusCode != 200
          ? Left(
        ServerFailure(
          errorModel: errorModelFromJson(response.data),
        ),
      )
          : Right(EmployeeModel.fromJson(_handleResponseAsJson(response)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, CompanyModel>> postNewCompany(
    String companyNameAr,
    String companyNameEn,
    String whatsappNum,
    String logo,
    String desc,
  ) async {
    AuthModel authModel = await Preferences.instance.getUserModel();
    // Response? res;

    try {
      Response res = await dio.post(
        EndPoints.companyUrl,
        body: {
          "companyName": companyNameAr,
          "companyNameE": companyNameEn,
          "userId": 0,
          "whatsAppNo": whatsappNum,
          "id": 0,
          "logo": logo,
          "description": desc,
          "descriptionE": desc,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${authModel.token!}',
          },
        ),
      );
      return res.statusCode != 200
          ? Left(
              ServerFailure(
                errorModel: errorModelFromJson(res.data),
              ),
            )
          : Right(CompanyModel.fromJson(_handleResponseAsJson(res)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

dynamic _handleResponseAsJson(Response<dynamic> response) {
  final responseJson = jsonDecode(response.data);
  return responseJson;
}

dynamic handleDioError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      throw const FetchDataException();
    case DioErrorType.response:
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.unautherized:
          throw const UnauthorizedException();
        case StatusCode.forbidden:
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.conflict:
          throw const ConflictException();
        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
      break;
    case DioErrorType.cancel:
    case DioErrorType.other:
      throw const NoInternetConnectionException();
  }
}

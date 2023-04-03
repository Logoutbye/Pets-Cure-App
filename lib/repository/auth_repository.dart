import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/user_model_forgot_password.dart';
import 'package:mvvm_practice_app/res/app_url.dart';

class AuthRepository {
  BaseApiServeces _apiServeces = NetworkApiServece();

// function to hit loginApi
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          _apiServeces.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // function to hit registor Api
  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          _apiServeces.getPostApiResponse(AppUrl.signUpUserUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  //  function to hit all pets data api
  Future<List<UserModelForForgotPassword>>
      fetchUserDataForForgotPasswordFromApiList(String mobileNumber) async {
    try {
      List<dynamic> response = await _apiServeces
          .getGetApiResponse("${AppUrl.forgotPasswordUrl}$mobileNumber");
      if (kDebugMode) {
        print(' My Json Data in Repository : ${response}');
      }

      return response
          .map((e) => UserModelForForgotPassword.fromJson(e))
          .toList();
    } catch (e) {
      throw e;
    }
  }

  // function to hit loginApi
  Future<List<UserModelForForgotPassword>> signInApi(
      String mobile_number, String passord) async {
    try {
      List<dynamic> response = await _apiServeces
          .getGetApiResponse("${AppUrl.signInUrl}${mobile_number}/${passord}");
      //"https://kawiishapps.com/api/signin/00000000000/12345678");
      //;
      if (kDebugMode) {
        print(' My Json Data in Repository : ${response}');
      }
      return response
          .map((e) => UserModelForForgotPassword.fromJson(e))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}

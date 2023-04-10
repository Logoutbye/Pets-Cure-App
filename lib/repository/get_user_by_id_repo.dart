import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/user_model_forgot_password.dart';
import 'package:mvvm_practice_app/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserByIdRepository {
  BaseApiServeces _apiServeces = NetworkApiServece();

// function to hit GetUser By Id
  Future<List<UserModelForForgotPassword>> GetUserByIdApi(var id) async {
    try {
      List<dynamic> response =
          await _apiServeces.getGetApiResponse('${AppUrl.getUserById}$id}');
      if (kDebugMode) {
        print("i am a sucessful reponse in repository layer of get user by id which is: $response");
      }
      return response
          .map((e) => UserModelForForgotPassword.fromJson(e))
          .toList();
      // return response;
    } catch (e) {
      print("i am a unsucessful in repository layer of get user by id");
      throw e;
    }
  }

}

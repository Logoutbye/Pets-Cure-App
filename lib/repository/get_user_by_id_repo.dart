import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/user_model_forgot_password.dart';
import 'package:mvvm_practice_app/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserByIdRepository {
  BaseApiServeces _apiServeces = NetworkApiServece();

// function to hit GetUser By Id
  Future<dynamic> GetUserByIdApi(var id) async {
    try {
      dynamic response =
          _apiServeces.getGetApiResponse('${AppUrl.getUserById}$id}');
          if(kDebugMode){
            print("$response");
          }
      return response;
    } catch (e) {
      throw e;
    }
  }

}

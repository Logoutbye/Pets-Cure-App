import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
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
          _apiServeces.getPostApiResponse(AppUrl.registorEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

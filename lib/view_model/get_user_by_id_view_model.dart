

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/repository/get_user_by_id_repo.dart';
import 'package:mvvm_practice_app/utils/utils.dart';

import '../data/response/api_response.dart';
import '../model/user_model_forgot_password.dart';

class GetUserByIdViewModel with ChangeNotifier{

    final _myRepo = GetUserByIdRepository();



    Future<void> getUserByIdDatafromRepository(
      var id, BuildContext context) async {
    getUSerById(ApiListResponse.loading());
    _myRepo.GetUserByIdApi(id).then((value) {
      getUSerById(ApiListResponse.completed(value));
      if (kDebugMode) {
        Utils.flushBarErrorMessage("Successfull getting user data", context);
        print('my value in View Model is : $value');
        print('my value in View Model length : ${getUSerDataById.data![0]}');
      }
    }).onError((error, stackTrace) {
      getUSerById(ApiListResponse.error(error.toString()));
      Utils.flushBarErrorMessage(
          "UnSuccessfull for getting user data", context);
    });
  }
  
  ApiListResponse<UserModelForForgotPassword> getUSerDataById =
      ApiListResponse.loading();

  // store all the json data return from response into the userDataforgorgotpassword variable
  getUSerById(ApiListResponse<UserModelForForgotPassword> response) {
    getUSerDataById = response;
    notifyListeners();
  }
  }
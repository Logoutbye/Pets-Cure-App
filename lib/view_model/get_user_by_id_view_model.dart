import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/repository/get_user_by_id_repo.dart';
import 'package:mvvm_practice_app/utils/utils.dart';

import '../data/response/api_response.dart';
import '../model/user_model_forgot_password.dart';

class GetUserByIdViewModel with ChangeNotifier {
  final _myRepo = GetUserByIdRepository();

  // for login
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // for signup
  bool _signUpLoading = false;

  bool get signUploading => _signUpLoading;
  bool _isUserLoginDataFetched = false;
  // for forgot Password
  bool _forgotPassword = false;
  bool _isEmailSend = false;

  bool get isEmailSend => _isEmailSend;

  bool get forgotLoading => _forgotPassword;

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  void setForgotPasswordLoading(bool value) {
    _forgotPassword = value;
    notifyListeners();
  }

  void setIsEmailSend(bool value) {
    _isEmailSend = value;
    notifyListeners();
  }

  ApiListResponse<UserModelForForgotPassword> getUSerDataById =
      ApiListResponse.loading();

  // store all the json data return from response into the userDataforgorgotpassword variable
  getUSerById(ApiListResponse<UserModelForForgotPassword> response) {
    getUSerDataById = response;
    notifyListeners();
  }

  // store all the json data return from response into the userDataforgorgotpassword variable
  setUserLoginData(ApiListResponse<UserModelForForgotPassword> response) {
     getUSerDataById = response;
    notifyListeners();
  }

  void userLoginDataFetched(bool value) {
    _isUserLoginDataFetched = value;
    notifyListeners();
  }

  Future<void> getUserByIdDatafromRepository(
      var id, BuildContext context) async {
    setUserLoginData(ApiListResponse.loading());
    setForgotPasswordLoading(true);
    _myRepo.GetUserByIdApi(id).then((value) {
      setUserLoginData(ApiListResponse.completed(value));
      setForgotPasswordLoading(false);
      userLoginDataFetched(true);
      print("i am in view model ad i am successful");
      if (kDebugMode) {
        Utils.flushBarErrorMessage(
            "i am in view model ad i am successful", context);
        print('my value in View Model is : $value');
        print('my value in View Model length : ${getUSerDataById.data![0]}');
      }
    }).onError((error, stackTrace) {
      setForgotPasswordLoading(false);
      userLoginDataFetched(false);
      setUserLoginData(ApiListResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }

  //   Future<void> getUserByIdDatafromRepository(var id, BuildContext context) async {
  //   getUSerById(ApiListResponse.loading());
  //   _myRepo.GetUserByIdApi(id).then((value) {
  //     getUSerById(ApiListResponse.completed(value));
  //     if (kDebugMode) {
  //       Utils.flushBarErrorMessage("Successfull getting user data", context);
  //       print('my value in View Model is : $value');
  //       print('my value in View Model length : ${getUSerDataById.data![0]}');
  //     }
  //   }).onError((error, stackTrace) {
  //     getUSerById(ApiListResponse.error(error.toString()));
  //     Utils.flushBarErrorMessage(
  //         "UnSuccessfull for getting user data", context);
  //   });
  // }

}

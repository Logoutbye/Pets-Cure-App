import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_pets_petsmarket_data_model.dart';
import 'package:mvvm_practice_app/model/user_model.dart';
import 'package:mvvm_practice_app/model/user_model_forgot_password.dart';
import 'package:mvvm_practice_app/repository/auth_repository.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view/auth_ui/LoginScreen.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

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

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  // for forgot Password
  bool _forgotPassword = false;
  bool _isEmailSend = false;

  bool get isEmailSend => _isEmailSend;

  bool get forgotLoading => _forgotPassword;

  void setForgotPasswordLoading(bool value) {
    _forgotPassword = value;
    notifyListeners();
  }

  void setIsEmailSend(bool value) {
    _isEmailSend = value;
    notifyListeners();
  }

  final saveUserData = UserViewModel();
  final usermodel = UserModel();

// Loigin api function which is called from UI
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage(value.toString(), context);
      if (kDebugMode) {
        print(value.toString());
      }
      usermodel.token = value.toString();
      saveUserData.saveUser(usermodel);
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
    });
  }

// Signup api function which is called from UI
  Future<void> SignUpApi(
    dynamic data,
    BuildContext context,
  ) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      // store signup data into share prefrences to handle session

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
      Utils.flushBarErrorMessage("Signup Success, Please Login ", context);

      if (kDebugMode) {
        print(value.toString());
      }

      setSignUpLoading(false);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      setSignUpLoading(false);
    });
  }

// forgot password function
  ApiListResponse<UserModelForForgotPassword> userDataForForgotPassword =
      ApiListResponse.loading();

  // store all the json data return from response into the userDataforgorgotpassword variable
  setUserForgotPasswordData(
      ApiListResponse<UserModelForForgotPassword> response) {
    userDataForForgotPassword = response;
    notifyListeners();
  }

  Future<void> fetchUserDataForForgotPasswordFromRepository(
      String mobileNumber, BuildContext context) async {
    setUserForgotPasswordData(ApiListResponse.loading());
    setForgotPasswordLoading(true);
    _myRepo
        .fetchUserDataForForgotPasswordFromApiList(mobileNumber)
        .then((value) {
      setUserForgotPasswordData(ApiListResponse.completed(value));
      setForgotPasswordLoading(false);
      setIsEmailSend(true);
      Utils.flushBarErrorMessage(
          "Email sent Succesfully, check your inbox or spam", context);
      print('my value in View Model is : $value');
      print(
          'my value in View Model length : ${userDataForForgotPassword.data![0].email}');
    }).onError((error, stackTrace) {
      setForgotPasswordLoading(false);
      setIsEmailSend(false);
      setUserForgotPasswordData(ApiListResponse.error(error.toString()));
      Utils.flushBarErrorMessage(
          "Server error or your mobile number is not register", context);
    });
  }

  // forgot password function

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  void setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  ApiListResponse<UserModelForForgotPassword> userDataForLogin =
      ApiListResponse.loading();

  // store all the json data return from response into the userDataforgorgotpassword variable
  setUserLoginData(ApiListResponse<UserModelForForgotPassword> response) {
    userDataForLogin = response;
    notifyListeners();
  }

  bool _isUserLoginDataFetched = false;

  bool get isUserLoginDataFetched => _isUserLoginDataFetched;

  void userLoginDataFetched(bool value) {
    _isUserLoginDataFetched = value;
    notifyListeners();
  }

  Future<void> getLoginDatafromAuthRepository(
      String mobile_number, String password, BuildContext context) async {
    setUserLoginData(ApiListResponse.loading());
    setForgotPasswordLoading(true);
    _myRepo.signInApi(mobile_number, password).then((value) {
      setUserLoginData(ApiListResponse.completed(value));
      setForgotPasswordLoading(false);
      userLoginDataFetched(true);

      if (kDebugMode) {
        Utils.flushBarErrorMessage("Login Success", context);
        print('my value in View Model is : $value');
        print('my value in View Model length : ${userDataForLogin.data![0]}');
      }
    }).onError((error, stackTrace) {
      setForgotPasswordLoading(false);
      userLoginDataFetched(false);
      setUserLoginData(ApiListResponse.error(error.toString()));
      Utils.flushBarErrorMessage(
          "Mobile number or password is incorrect", context);
    });
  }
}

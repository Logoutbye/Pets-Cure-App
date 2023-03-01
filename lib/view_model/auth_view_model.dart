import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/model/user_model.dart';
import 'package:mvvm_practice_app/repository/auth_repository.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view_model/user_view_model.dart';

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
  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage(value.toString(), context);
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
}

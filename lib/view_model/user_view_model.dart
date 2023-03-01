import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  // save user token in local storage
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

// return the stored value in shared prefrences
  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(
      token: token.toString(),
    );
  }

  // reomove session token from sharedPrefrences
  Future<bool> removeSession() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    notifyListeners();
    return true;
  }
}

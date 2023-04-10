import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/repository/all_pets_petsmarket_post_repo.dart';
import 'package:mvvm_practice_app/repository/update_user_profile_image_and_data_repo.dart';
import 'package:mvvm_practice_app/utils/utils.dart';

class UpdateUserProfileImageViewModel with ChangeNotifier {
  final _myRepo = UpdateUserProfileImageRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getUpdateUserProfileImagedataFromRepository(
      dynamic data, File? file, int id, BuildContext context) async {
    setLoading(true);
    //getAllPetsMarketPostResult(ApiResponse.loading());

    _myRepo.updateUserProfileImage(data, file, id).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Success', context);
      //getAllPetsMarketPostResult(ApiResponse.completed(value));
      if (kDebugMode) {
        print("$value My value in view model");
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print("$error");
      }
      Utils.flushBarErrorMessage(error.toString(), context);
      //getAllPetsMarketPostResult(ApiResponse.error(error.toString()));
    });
  }
}

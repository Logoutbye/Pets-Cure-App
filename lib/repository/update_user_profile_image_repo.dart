import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/res/app_url.dart';

class UpdateUserProfileImageRepo {
  BaseApiServeces _apiServeces = NetworkApiServece();

  Future updateUserProfileImage(dynamic data, File? file, int id) async {
    try {
      dynamic Response = await _apiServeces.getPostApiResponseWithFile(
          "${AppUrl.updateUSerProfileImage}$id", data, file);

      if (kDebugMode) {
        print("my respose in repository : $Response");
      }
      return Response;
    } catch (e) {
      throw e;
    }
  }
}

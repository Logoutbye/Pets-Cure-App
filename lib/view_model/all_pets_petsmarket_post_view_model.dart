import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_post_api_response_data_model.dart';
import 'package:mvvm_practice_app/repository/all_pets_petsmarket_post_repo.dart';
import 'package:mvvm_practice_app/utils/utils.dart';

class AllPetsMarketPostPetViewModel with ChangeNotifier {
  final _myRepo = AllPetsMarketPostRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // ApiResponse<AllPostApiResponseDataModel> SinglePetMarketPosted =
  //     ApiResponse.loading();

// get the post response and store it into the
  // getAllPetsMarketPostResult(
  //     ApiResponse<AllPostApiResponseDataModel> response) {
  //   SinglePetMarketPosted = response;
  //   notifyListeners();
  // }

  Future<void> getPetMarketPostResultFromApi(
      dynamic data, File? file, BuildContext context) async {
    setLoading(true);
    //getAllPetsMarketPostResult(ApiResponse.loading());

    _myRepo.InsertSinglePetDataUsingPostApi(data, file).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Success', context);
      //getAllPetsMarketPostResult(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      //getAllPetsMarketPostResult(ApiResponse.error(error.toString()));
    });
  }

  // function to update post

  Future<void> getPetMarketPostResultFromUpdatePostApi(
      dynamic data, File? file, BuildContext context) async {
    setLoading(true);
    //getAllPetsMarketPostResult(ApiResponse.loading());

    _myRepo.UpdateSinglePetDataUsingPostApi(data, file).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Success', context);
      //getAllPetsMarketPostResult(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      //getAllPetsMarketPostResult(ApiResponse.error(error.toString()));
    });
  }
}

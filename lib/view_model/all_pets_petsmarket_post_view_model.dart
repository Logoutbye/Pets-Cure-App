import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/main.dart';
import 'package:mvvm_practice_app/model/all_post_api_response_data_model.dart';
import 'package:mvvm_practice_app/repository/all_pets_petsmarket_post_repo.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/user_posts_in_pets_market.dart';

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
      //navigatorKey.currentState!.popUntil((route) => route.isFirst);
      //final navigatorKey = GlobalKey<NavigatorState>();
      //Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MyPostsInPetsMarket();
      }));
      //getAllPetsMarketPostResult(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      //getAllPetsMarketPostResult(ApiResponse.error(error.toString()));
    });
  }

  // function to update post

  Future<void> getPetMarketPostResultFromUpdatePostApi(
      dynamic data, File? file, BuildContext context, int postId) async {
    setLoading(true);
    //getAllPetsMarketPostResult(ApiResponse.loading());

    _myRepo.UpdateSinglePetDataUsingPostApi(data, file, postId).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Success', context);
      //getAllPetsMarketPostResult(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      print("Erorr : $error");
      Utils.flushBarErrorMessage(error.toString(), context);
      //getAllPetsMarketPostResult(ApiResponse.error(error.toString()));
    });
  }
}

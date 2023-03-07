import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_pets_petsmarket_data_model.dart';
import 'package:mvvm_practice_app/repository/all_pets_petsmarket_repo.dart';

class AllPetsMarketViewModel with ChangeNotifier {
  final _myRepo = AllPetsMarketRepository();

  ApiListResponse<PetsMarketModel> apiListResponse = ApiListResponse.loading();

  // store all the json data return from response into the AllDoctorList variable
  setAllPetsMarket(ApiListResponse<PetsMarketModel> response) {
    apiListResponse = response;
    notifyListeners();
  }

  Future<void> fetchAllPetsFromPetsMarketApiList() async {
    setAllPetsMarket(ApiListResponse.loading());

    _myRepo.fetchAllPetsFromFetchMarketApiList().then((value) {
      setAllPetsMarket(ApiListResponse.completed(value));
    }).onError((error, stackTrace) {
      setAllPetsMarket(ApiListResponse.error(error.toString()));
    });
  }
}

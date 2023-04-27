import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_pets_petsmarket_data_model.dart';
import 'package:mvvm_practice_app/repository/all_pets_petsmarket_get_repo.dart';

class AllPetsMarketViewModel with ChangeNotifier {
  final _myRepo = AllPetsMarketRepository();

  ApiListResponse<PetsMarketModel> allMarketPets = ApiListResponse.loading();

  // store all the json data return from response into the AllDoctorList variable
  setAllPetsMarket(ApiListResponse<PetsMarketModel> response) {
    allMarketPets = response;
    notifyListeners();
  }

// fetch all the pets in pets market
  Future<void> fetchAllPetsFromPetsMarketApiList() async {
    setAllPetsMarket(ApiListResponse.loading());

    _myRepo.fetchAllPetsFromFetchMarketApiList().then((value) {
      setAllPetsMarket(ApiListResponse.completed(value));
    }).onError((error, stackTrace) {
      setAllPetsMarket(ApiListResponse.error(error.toString()));
    });
  }

  Future<void> fetchAllPetsPostsofUserFromPetsMarket(int id) async {
    setAllPetsMarket(ApiListResponse.loading());

    _myRepo.fetchAllPetsPostOfUserFromFetchMarketApiList(id).then((value) {
      setAllPetsMarket(ApiListResponse.completed(value));
      if (kDebugMode) {
        print("my data in viewmodel : $value");
      }
    }).onError((error, stackTrace) {
      setAllPetsMarket(ApiListResponse.error(error.toString()));
    });
  }
}

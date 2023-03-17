import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/all_pets_petsmarket_data_model.dart';
import 'package:mvvm_practice_app/res/app_url.dart';

class AllPetsMarketRepository {
  // creating object of BaseApiServeces
  BaseApiServeces _apiServeces = NetworkApiServece();

  //  function to hit all pets data api
  Future<List<PetsMarketModel>> fetchAllPetsFromFetchMarketApiList() async {
    try {
      List<dynamic> response =
          await _apiServeces.getGetApiResponse(AppUrl.allPetsMarketUrl);

      // print('$response');
      return response.map((e) => PetsMarketModel.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
  }
}

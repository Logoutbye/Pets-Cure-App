import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/all_doctors_data_model.dart';
import 'package:mvvm_practice_app/res/app_url.dart';

class AllDoctorsRepository {
  // creating object of BaseApiServeces
  BaseApiServeces _apiServeces = NetworkApiServece();

  // function to hit all doctors data api
  Future<List<AllDoctorsDataModel>> fetchAllDoctorsListFromApi() async {
    try {
      List<dynamic> response =
          await _apiServeces.getGetApiResponse(AppUrl.allDoctorsUrl);
      // print('Response at repo function : $response ');
      return response.map((e) => AllDoctorsDataModel.fromJson(e)).toList();

      // return response = AllDoctorsDataModel.fromJson(response[0]);
    } catch (e) {
      throw e;
    }
  }
}

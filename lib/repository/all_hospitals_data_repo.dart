import 'package:mvvm_practice_app/data/network/BaseApiService.dart';
import 'package:mvvm_practice_app/data/network/NetworkApiService.dart';
import 'package:mvvm_practice_app/model/all_hospitals_data_model.dart';
import 'package:mvvm_practice_app/res/app_url.dart';

class AllHospitalRepository {
  // creating object of BaseApiServeces
  BaseApiServeces _apiServeces = NetworkApiServece();

// function to hit all doctors data api
  Future<List<AllHospitalDataModel>> fetchAllDoctorsListFromApi() async {
    try {
      List<dynamic> response =
          await _apiServeces.getGetApiResponse(AppUrl.allHospitalsUrl);

      // print("Json Data: $response");
      return response.map((e) => AllHospitalDataModel.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
  }
}

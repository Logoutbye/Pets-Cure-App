import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_doctors_data_model.dart';
import 'package:mvvm_practice_app/repository/all_doctors_data_repo.dart';

class AllDoctorsViewModel with ChangeNotifier {
  final _myRepo = AllDoctorsRepository();

  ApiListResponse<AllDoctorsDataModel> allDoctorList =
      ApiListResponse.loading();

  // store all the json data return from response into the AllDoctorList variable
  setAllDoctorsData(ApiListResponse<AllDoctorsDataModel> response) {
    allDoctorList = response;
    notifyListeners();
  }

  Future<void> fetchAllDoctorsDataFromApiFunc() async {
    setAllDoctorsData(ApiListResponse.loading());
    _myRepo.fetchAllDoctorsListFromApi().then((value) {
      //print('Response at view model function : ' + value.toString());
      setAllDoctorsData(ApiListResponse.completed(value));
    }).onError((error, stackTrace) {
      setAllDoctorsData(ApiListResponse.error(error.toString()));
    });
  }
}

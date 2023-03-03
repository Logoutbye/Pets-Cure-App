import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/model/all_hospitals_data_model.dart';
import 'package:mvvm_practice_app/repository/all_hospitals_data_repo.dart';

class AllHospitalViewModel with ChangeNotifier {
  final _myRepo = AllHospitalRepository();

  ApiListResponse<AllHospitalDataModel> allHospitals =
      ApiListResponse.loading();

  // store all the json data return from response into the AllDoctorList variable
  setAllHospitalsData(ApiListResponse<AllHospitalDataModel> response) {
    allHospitals = response;
    notifyListeners();
  }

// Function to get Data from AllHospital Repository
  Future<void> fetchAllHospitalsDataFromRepo() async {
    setAllHospitalsData(ApiListResponse.loading());

    _myRepo.fetchAllDoctorsListFromApi().then((value) {
      setAllHospitalsData(ApiListResponse.completed(value));
    }).onError((error, stackTrace) {
      setAllHospitalsData(ApiListResponse.error(error.toString()));
    });
  }
}

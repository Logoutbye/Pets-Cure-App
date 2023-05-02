import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice_app/data/response/api_response.dart';
import 'package:mvvm_practice_app/repository/delete_post_by_id_repo.dart';

import '../utils/utils.dart';

class DeletePostByIdViewModel with ChangeNotifier {
  final _myRepo = DeletePostByIdRepository();

  // for deleting
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  
  Future<void> getUserByIdDatafromRepository(
      var id, BuildContext context) async {
    _myRepo.DeleteUserByIdApi(id).then((value) {
      print("i am in view model ad i am successful");
      if (kDebugMode) {
        Utils.flushBarErrorMessage(
            "i am in view model ad i am successful", context);
        print('my value in View Model is : $value');
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      print('i am in view model and the error is: ${error.toString()}');
    });
  }
}

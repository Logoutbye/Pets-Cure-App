import 'package:mvvm_practice_app/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

// response type
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data ";
  }
}

class ApiListResponse<T> {
  Status? status;
  List<T>? data;
  String? message;

  ApiListResponse(this.status, this.data, this.message);

// response type
  ApiListResponse.loading() : status = Status.LOADING;
  ApiListResponse.completed(this.data) : status = Status.COMPLETED;
  ApiListResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data ";
  }
}

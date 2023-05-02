import 'dart:io';

abstract class BaseApiServeces {
  Future<dynamic> getGetApiResponse(String Url);
  Future<dynamic> getPostApiResponse(String Url, dynamic data);
  Future<dynamic> getPostApiResponseWithFile(
      String Url, dynamic data, File? file);
  Future<dynamic> getPutApiResponse(String Url, dynamic data);
  Future<dynamic> deleteApi(String Url);
  getPostApiResponseWithFileandData(String Url, dynamic data, File? file);
}

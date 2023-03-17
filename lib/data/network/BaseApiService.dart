import 'dart:io';

abstract class BaseApiServeces {
  Future<dynamic> getGetApiResponse(String Url);
  Future<dynamic> getPostApiResponse(String Url, dynamic data);
  Future<dynamic> getPostApiResponseWithFile(
      String Url, dynamic data, File? file);
}

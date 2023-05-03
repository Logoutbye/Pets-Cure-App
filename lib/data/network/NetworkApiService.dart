import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:http/http.dart';
import 'package:mvvm_practice_app/data/app_exception.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';

import 'package:http/http.dart' as http;

class NetworkApiServece extends BaseApiServeces {
  @override
  Future deleteApi(String Url) async {
      dynamic responseJson;

    try {
      final response =
          await http.delete(Uri.parse(Url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
      //print("type of response : " + responseJson[0]);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }

    return responseJson;
    // TODO: implement deletePetPostByUser
    throw UnimplementedError();
  }

  // function for get api response and will return the json body of the api
  @override
  Future getGetApiResponse(String Url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
      //print("type of response : " + responseJson[0]);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }

    return responseJson;
  }

// post data using api
  @override
  Future getPostApiResponse(String Url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(Url),
        body: data,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }

    return responseJson;
  }

  // put data using api
  @override
  Future getPutApiResponse(String Url, data) async {
    dynamic responseJson;

    try {
      Response response = await put(
        Uri.parse(Url),
        body: data,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }

    return responseJson;
  }

  // post data using api with file uploading

  @override
  Future getPostApiResponseWithFile(String Url, data, File? file) async {
    dynamic responseJson;

    try {
      var stream = new http.ByteStream(file!.openRead());

      stream.cast();

      var length = await file.length();

      //var uri = Uri.parse('https://kawiishapps.com/api/postpets');
      var uri = Uri.parse(Url);

      var request = new http.MultipartRequest('POST', uri);

      request.fields.addAll(data);

      request.files
          .add(await http.MultipartFile.fromPath('file', '${file.path}'));

      var response = await request.send();

      print(response.stream.toString());
      if (response.statusCode == 200) {
        // decoding StreamResponse body and then returning in responseJson variable
        response.stream.listen((dataa) {
          final decodedData = utf8.decode(dataa);

          responseJson = decodedData;
        });

        return responseJson;

        if (kDebugMode) {
          print('image uploaded');
        }
      } else {
        if (kDebugMode) {
          print('failed');
          print("My Status Code : ${response.statusCode}");
          throw FetchDataException(
              ' Some Thing went wrong with  ${response.statusCode.toString()}');
        }
      }

      // Response response = await post(
      //   Uri.parse(Url),
      //   body: data,
      // );
      // responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }

    //return responseJson;
  }

  // checking for updating file and data using api

  @override
  Future getPostApiResponseWithFileandData(String Url, data, File? file) async {
    dynamic responseJson;

    try {
      if (file != null) {
        var stream = new http.ByteStream(file.openRead());

        stream.cast();

        var length = await file.length();
      }

      //var uri = Uri.parse('https://kawiishapps.com/api/postpets');
      var uri = Uri.parse(Url);

      var request = new http.MultipartRequest('POST', uri);

      request.fields.addAll(data);

      if (file != null) {
        request.files
            .add(await http.MultipartFile.fromPath('file', '${file.path}'));
      } else {
        request.files.add(await http.MultipartFile.fromPath('file', '${null}'));
      }

      var response = await request.send();

      print(response.stream.toString());
      if (response.statusCode == 200) {
        // decoding StreamResponse body and then returning in responseJson variable
        response.stream.listen((dataa) {
          final decodedData = utf8.decode(dataa);

          responseJson = decodedData;
        });

        return responseJson;

        if (kDebugMode) {
          print('image uploaded');
        }
      } else {
        if (kDebugMode) {
          print('failed');
          print("My Status Code : ${response.statusCode}");
          throw FetchDataException(
              ' Some Thing went wrong with  ${response.statusCode.toString()}');
        }
      }

      // Response response = await post(
      //   Uri.parse(Url),
      //   body: data,
      // );
      // responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          ' No Internet Connection \n Check your connection, then refresh the page.');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print("My Api Response Data In Netwrok Layer :  + $responseJson");
        }

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      case 500:
        throw InvalidConfigException(response.body.toString());
      //'Mobile number is already resgistered! please use other');
      default:
        throw FetchDataException(
            ' Error Occured while Comunicating with server with Status Code ${response.statusCode.toString()}');
    }
  }
}

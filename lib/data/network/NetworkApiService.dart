import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mvvm_practice_app/data/app_exception.dart';
import 'package:mvvm_practice_app/data/network/BaseApiService.dart';

import 'package:http/http.dart' as http;

class NetworkApiServece extends BaseApiServeces {
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

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        //print("My Api Response Data : " + json.decode(response.body));
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            ' Error Occured while Comunicating with server with Status Code ${response.statusCode.toString()}');
    }
  }
}

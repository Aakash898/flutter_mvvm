import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Conection");
    }

    //if true then it'll return jso response
    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Connection");
    }

    //if true then it'll return jso response
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(message: response.body.toString());
      case 401:
        throw UnAuthorizedException(message: response.body.toString());
      default:
        throw FetchDataException(
            message:
                "Error occured while communicating with server with ctatus code" +
                    response.statusCode.toString());
    }
  }
}

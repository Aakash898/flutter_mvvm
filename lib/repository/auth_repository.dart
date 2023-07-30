import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'package:flutter_mvvm/data/network/network_api_service.dart';
import 'package:flutter_mvvm/resources/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{
    dynamic response = await apiServices.postApiResponse(AppUrl.baseUrl, data);
    try{
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> registrationApi(dynamic data) async {
    dynamic response =
    await apiServices.postApiResponse(AppUrl.registerUrl, data);
    try {
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
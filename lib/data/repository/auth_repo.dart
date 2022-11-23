import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery/data/api/api_client.dart';

class AuthRepo {
  final ApiCLient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstans.REGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) {
    apiClient.token = token;
    
  }
}

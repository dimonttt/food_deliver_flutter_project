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

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstans.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstans.TOKEN) ?? "None";
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstans.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);
    return await sharedPreferences.setString(AppConstans.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstans.PHONE, number);
      await sharedPreferences.setString(AppConstans.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstans.TOKEN);
    sharedPreferences.remove(AppConstans.PASSWORD);
    sharedPreferences.remove(AppConstans.PHONE);
    apiClient.token = '';
    apiClient.updateHeaders('');
    return true;
  }
}

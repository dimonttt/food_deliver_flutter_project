import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiCLient apiCLient;
  UserRepo({required this.apiCLient});

  Future<Response> getUserInfo() async {
    return apiCLient.getData(AppConstans.USER_INFO_URI);
  }
}

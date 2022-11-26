import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/cart_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommend_product_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut<ApiCLient>(() => ApiCLient(appBaseUrl: AppConstans.BASE_URL, sharedPreferences:Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiCLient: Get.find()));
  //repos
  Get.lazyPut<PopularProductRepo>(
      () => PopularProductRepo(apiCLient: Get.find()));

  Get.lazyPut<RecommendedProductRepo>(
      () => RecommendedProductRepo(apiCLient: Get.find()));

  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));


  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut<PopularProductController>(
      () => PopularProductController(popularProductRepo: Get.find()));

  Get.lazyPut<RecommendedProductController>(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));

  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}

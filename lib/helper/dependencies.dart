import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommend_product_repo.dart';

Future<void> init() async {
  //aoi client
  Get.lazyPut<ApiCLient>(() => ApiCLient(appBaseUrl: AppConstans.BASE_URL));

  //repos
  Get.lazyPut<PopularProductRepo>(
      () => PopularProductRepo(apiCLient: Get.find()));

  Get.lazyPut<RecommendedProductRepo>(
      () => RecommendedProductRepo(apiCLient: Get.find()));

  //controllers
  Get.lazyPut<PopularProductController>(
      () => PopularProductController(popularProductRepo: Get.find()));

  Get.lazyPut<RecommendedProductController>(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}

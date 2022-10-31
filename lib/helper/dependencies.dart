import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //aoi client
  Get.lazyPut(() => ApiCLient(appBaseUrl: AppConstans.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiCLient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}

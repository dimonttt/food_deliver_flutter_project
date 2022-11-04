import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiCLient apiCLient;
  RecommendedProductRepo({required this.apiCLient});

  Future<Response> getRecommendedProductList() async {
    return await apiCLient.getData(AppConstans.RECOMMENDED_PRODUCT_URI);
  }
}

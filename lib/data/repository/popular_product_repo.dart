import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiCLient apiCLient;
  PopularProductRepo({required this.apiCLient});

  Future<Response> getPopularProductList() async {
    return await apiCLient.getData(AppConstans.POPULAR_PRODUCT_URI);
  }
}

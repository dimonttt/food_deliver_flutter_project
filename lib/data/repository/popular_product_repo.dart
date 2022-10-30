import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiCLient apiCLient;
  PopularProductRepo({required this.apiCLient});

  Future<Response> getPopularProductList() async {
    return await apiCLient.getData("https://www.dbstech.com/api/product/list");
  }
}

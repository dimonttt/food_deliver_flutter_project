import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiCLient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiCLient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstans.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Autorization': 'Bearer $token',
    };
  }

  void updateHeaders(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Autorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      Response response = await post(
        uri,
        body,
        headers: _mainHeaders,
      );
      //print(response.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}

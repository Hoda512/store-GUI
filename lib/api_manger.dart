import './model/product_response.dart';
import 'package:dio/dio.dart';

import '';

class api_mager {
  Dio dio = Dio();
  Future<List<ProductResponse>> getAllProducts() async {
    final respnse = await dio.get("https://api.escuelajs.co/api/v1/products");
    List<dynamic> data = respnse.data;
    return data
        .map(
          (product) => ProductResponse.fromJson(product),
        )
        .toList();
  }
}

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://yourapi.com/api",
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ));
  Future<List<ProductResponse>> searchProducts(String query) async {
    try {
      Response response =
          await _dio.get("/products/search", queryParameters: {"name": query});

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => ProductResponse.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}

import 'package:ecommerce_app/model/product_detail_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// product repository provider to call repository functions

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

class ProductRepository {
  // network library instance
  DioClient dio = DioClient();

  // api call to get all products
  Future<ProductModel> getProducts() async {
    try {
      final response = await dio.get(
        endPoint: 'v2/list?store=US&offset=0&categoryId=4209&limit=48',
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // api call to get single product details
  Future<ProductDetailModel> getProductDetail(String id) async {
    try {
      final response = await dio.get(
        endPoint: 'v3/detail?id=$id',
      );
      return ProductDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

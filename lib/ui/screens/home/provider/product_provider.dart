import 'package:ecommerce_app/model/product_detail_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/ui/screens/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// provider to call all the products
final productListProvider =
    FutureProvider.autoDispose<ProductModel>((ref) async {
  return ref.watch(productRepositoryProvider).getProducts();
});

// provider to call single product details
final productDetailProvider = FutureProvider.family
    .autoDispose<ProductDetailModel, String>((ref, id) async {
  return ref.watch(productRepositoryProvider).getProductDetail(id);
});

// notifier provider to store product Id

final productIdStateProvider = StateProvider<int>((ref) {
  return 0;
});



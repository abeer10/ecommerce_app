import 'package:ecommerce_app/ui/screens/cart/controller/cart_controller.dart';
import 'package:ecommerce_app/ui/screens/cart/state/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// cart controller provider to manage all controller function
final cartControllerProvider =
    AsyncNotifierProvider<CartController, CartState>(() {
  return CartController();
});

// cart total notifier provider
final cartTotalProvider = StateProvider<int>((ref) {
  return 0;
});

import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/ui/screens/cart/view/cart_screen.dart';
import 'package:ecommerce_app/ui/screens/home/view/home_screen.dart';
import 'package:ecommerce_app/ui/screens/home/view/product_detail_screen.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.homeScreen: (context) => HomeScreen(),
      AppRoutes.productDetailScreen: (context) => ProductDetailScreen(),
      AppRoutes.cartScreen: (context) => const CartScreen(),
    };
  }
}

import 'dart:io';

import 'package:ecommerce_app/ui/screens/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/ui/widgets/cart_product_card.dart';
import 'package:ecommerce_app/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/ui/widgets/round_corner_button.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // cart provider to get all cart items
    final cartController = ref.watch(cartControllerProvider);
    // total notifier to get cart total
    final totalCartProvider = ref.watch(cartTotalProvider.notifier);

    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        body: cartController.when(
            data: (data) => data.cartItems.isEmpty
                ? Center(
                    child: Text(
                    'Empty Cart',
                    style: AppTextStyles.text16
                        .copyWith(fontWeight: FontWeight.bold),
                  ))
                : Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.cartItems.length,
                            itemBuilder: (context, index) {
                              // cart product widget
                              return CartProductCard(
                                cartProduct: data.cartItems[index],
                              );
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70.h,
                          margin: EdgeInsets.only(bottom:Platform.isIOS ? 40.h : 10.h),
                          padding: EdgeInsets.only(
                              top: 10.h, left: 12.w, right: 12.w,  ),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey, // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 10, // Blur radius
                                offset: Offset(0, 3), // Offset in x and y axes
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total',
                                      style: AppTextStyles.text14.copyWith(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.bold)),
                                  Text('\$${totalCartProvider.state}', style: AppTextStyles.text18)
                                ],
                              ),
                              RoundCornerButton(
                                  width: 200.w, buttonText: 'Checkout')
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
            error: (error, stackTrace) => Center(child: Text('Error $error, $stackTrace')),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}

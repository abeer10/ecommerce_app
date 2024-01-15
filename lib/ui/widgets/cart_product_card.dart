import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/ui/screens/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductCard extends ConsumerWidget {
  CartProductCard({required this.cartProduct, super.key});

  CartModel cartProduct;

  @override
  Widget build(BuildContext context, ref) {
    // cart controller provider to use cart operation CRUD
    final cartControllerNotifier = ref.watch(cartControllerProvider.notifier);
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://${cartProduct.image}',
              height: 90.h,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartProduct.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.text14
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${cartProduct.brand}',
                    style: AppTextStyles.text12.copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.darkGrey),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Size: ${cartProduct.size}',
                    style: AppTextStyles.text12
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${cartProduct.price}',
                        style: AppTextStyles.text12.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 10.w),
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        cartProduct.qty = cartProduct.qty! + 1;
                      });
                      cartControllerNotifier.updateItem(CartModel(
                          name: cartProduct.name,
                          brand: cartProduct.brand,
                          size: cartProduct.size,
                          qty: cartProduct.qty,
                          image: cartProduct.image,
                          price: cartProduct.price));
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.add, size: 16, color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    '${cartProduct.qty}',
                    style: AppTextStyles.text14
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.w),
                  InkWell(
                    onTap: () {
                      if (cartProduct.qty! > 1) {
                        setState(() {
                          cartProduct.qty = cartProduct.qty! - 1;
                        });
                        cartControllerNotifier.updateItem(CartModel(
                            name: cartProduct.name,
                            brand: cartProduct.brand,
                            size: cartProduct.size,
                            qty: cartProduct.qty,
                            image: cartProduct.image,
                            price: cartProduct.price));
                      } else {
                        cartControllerNotifier.deleteItem(cartProduct);
                      }
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.primary,
                      child:
                          Icon(Icons.remove, size: 16, color: AppColors.white),
                    ),
                  ),
                ],
              );
            })
          ],
        ));
  }
}

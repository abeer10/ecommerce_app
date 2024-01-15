import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/ui/screens/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends ConsumerWidget {
  Products product;

  ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartController = ref.read(cartControllerProvider.notifier);
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://${product.imageUrl}',
                    height: 150.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${product.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.text14
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5.h),
                Text(
                  '${product.brandName}',
                  style: AppTextStyles.text12.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.darkGrey),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price!.current!.text}',
                      style: AppTextStyles.text14.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary),
                    ),
                    InkWell(
                      onTap: () {
                        cartController.addItem(CartModel(
                            name: product.name,
                            price: product.price!.current!.value,
                            brand: product.brandName,
                            id: product.id!.toInt(),
                            image: product.imageUrl,
                            size: 14,
                            qty: 1));
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary),
                        child:  const Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColors.white,
                                size: 20,
                              ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Icon(Icons.favorite_outline, color: AppColors.darkGrey)
          ],
        ),
      ),
    );
  }
}

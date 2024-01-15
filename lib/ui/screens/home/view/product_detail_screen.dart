import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/ui/screens/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/ui/screens/home/provider/product_provider.dart';
import 'package:ecommerce_app/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/ui/widgets/round_corner_button.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';

class ProductDetailScreen extends ConsumerWidget {
  ProductDetailScreen({super.key});

 // local variables for qty and sizes
  int qty = 1, size = 0;

  @override
  Widget build(BuildContext context, ref) {
    // get product Id
    final productId = ref.watch(productIdStateProvider);
    // get product details
    final productDetail = ref.watch(productDetailProvider(productId.toString()));
    // add products to cart
    final cartControllerNotifier = ref.watch(cartControllerProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Detail',
        actions: [
          IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: productDetail.when(
            data: (data) => Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                              items: data.media!.images!
                                  .map(
                                    (e) => CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      imageUrl: 'https://${e.url}' ?? '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                height: 300.h,
                                viewportFraction: 1,
                                initialPage: 0,
                                disableCenter: true,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.2,
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(height: 10.h),
                          Text(
                            '${data.name}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.text16
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data.brand!.name}',
                            style: AppTextStyles.text14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkGrey),
                          ),
                          Text(
                            '${data.price!.current!.text}',
                            style: AppTextStyles.text18.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary),
                          ),
                          SizedBox(height: 5.h),
                          StatefulBuilder(builder: (context, setState) {
                            return Row(
                              children: [
                                Text(
                                  'Size:',
                                  style: AppTextStyles.text14
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: ListView.builder(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.all(4.0),
                                        shrinkWrap: true,
                                        itemCount: data.variants!.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  size = data.variants![index]
                                                      .sizeOrder!
                                                      .toInt();
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                height: 30.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: data.variants![index]
                                                                .sizeOrder!
                                                                .toInt() ==
                                                            size
                                                        ? AppColors.primary
                                                        : AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: AppColors.grey)),
                                                child: Center(
                                                    child: Text(
                                                  '${data.variants![index].sizeOrder}',
                                                  style: AppTextStyles.text14
                                                      .copyWith(
                                                          color: data
                                                                      .variants![
                                                                          index]
                                                                      .sizeOrder!
                                                                      .toInt() ==
                                                                  size
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .black),
                                                )),
                                              ),
                                            )),
                                  ),
                                )
                              ],
                            );
                          }),
                          SizedBox(height: 10.h),
                          StatefulBuilder(builder: (context, setState) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Qty:',
                                  style: AppTextStyles.text14
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (qty > 1) {
                                          setState(() {
                                            qty--;
                                          });
                                        }
                                      },
                                      child: const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: AppColors.primary,
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.white,
                                            size: 16,
                                          )),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      qty.toString(),
                                      style: AppTextStyles.text14.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10.w),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          qty++;
                                        });
                                      },
                                      child: const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: AppColors.primary,
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.white,
                                            size: 16,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
                          SizedBox(height: 10.h),
                          Text(
                            'Description',
                            style: AppTextStyles.text14
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            parse('${data.description}').body!.text,
                            style: AppTextStyles.text12,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: RoundCornerButton(
                              buttonText: 'Add To Cart',
                              onPressed: () {
                                cartControllerNotifier.addItem(CartModel(
                                    name: data.name,
                                    price: data.price!.current!.value,
                                    brand: data.brand?.name,
                                    id: data.id!.toInt(),
                                    image: data.media!.images![0].url,
                                    size: size,
                                    qty: qty));
                              },
                            )),
                            SizedBox(width: 20.w),
                            Expanded(
                                child: RoundCornerButton(
                              buttonText: 'Buy Now',
                              onPressed: () {
                                cartControllerNotifier.addItem(CartModel(
                                    name: data.name,
                                    price: data.price!.current!.value,
                                    brand: data.brand?.name,
                                    id: data.id!.toInt(),
                                    image: data.media!.images![0].url,
                                    size: size,
                                    qty: qty));
                                Navigator.pushNamed(
                                    context, AppRoutes.cartScreen);
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            error: (error, stackTrace) => Text('Error $error'),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}

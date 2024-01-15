import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/ui/screens/home/provider/product_provider.dart';
import 'package:ecommerce_app/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/ui/widgets/custom_text_field.dart';
import 'package:ecommerce_app/ui/widgets/product_card.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final productList = ref.watch(productListProvider);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Home',
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.cartScreen);
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: ListView(
            children: [
              Container(
                height: 40.h,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey)),
                child: Row(
                  children: [
                    const Icon(Icons.search,
                        color: AppColors.darkGrey, size: 28),
                    Expanded(
                        child: CustomTextField(
                            controller: searchCtrl,
                            labelText: 'Search..',
                            focusNode: FocusNode()))
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CarouselSlider(
                  items: sliderImages
                      .map(
                        (e) => CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          imageUrl: e,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 200.h,
                    viewportFraction: 1,
                    initialPage: 0,
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(height: 30.h),
              productList.when(
                  data: (data) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // Number of columns
                          crossAxisSpacing: 8.0.w,
                          // Spacing between columns
                          mainAxisSpacing: 20.0.h,
                          // Spacing between rown
                          mainAxisExtent: 290.h // Spacing between rows
                          ),
                      itemCount: data.products!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Product card widget
                        return InkWell(
                            onTap: () {
                              ref.read(productIdStateProvider.notifier).state =
                                  data.products![index].id!.toInt();
                              Navigator.pushNamed(
                                  context, AppRoutes.productDetailScreen);
                            },
                            child: ProductCard(product: data.products![index]));
                      }),
                  error: (error, stackTrace) => Center(child: Text('Error $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()))
            ],
          ),
        ));
  }
}

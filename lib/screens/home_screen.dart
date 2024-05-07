import 'package:book_verse/controller/top_books_controller.dart';
import 'package:book_verse/helpers/helper_func.dart';
import 'package:book_verse/helpers/scolors.dart';
import 'package:book_verse/screens/all_newBooks.dart';
import 'package:book_verse/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/connectivity_controller.dart';
import '../controller/new_book_controller.dart';
import '../shimmer/product_horizontal_shimmer.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/text.dart';
import '../widget/NoInternetToast.dart';
import '../widget/grid_layout.dart';
import '../widget/home_category.dart';
import '../widget/productcard_vertical.dart';
import '../widget/productcart_horizontal.dart';
import '../widget/promo_slider.dart';
import '../widget/section_heading.dart';
import 'all_books.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.find<ConnectivityController>();

    final darkMode = SHelperFunctions.isDarkMode(context);
    final controller = Get.put(NewBookController());
    final topBookController = Get.put(TopBookController());


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Obx(() {
                if (!connectivityController.isConnected.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    NoInternetToast.show(context);
                  });
                }
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: SPromoSlider(),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///popular Categories
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.defaultSpace / 2),
                      child: Column(
                        children: [
                          ///heading
                          SSectionHeading(
                            title: STexts.pCategory,
                            showActionButton: false,
                            textColor: darkMode ? Colors.white : Colors.black,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),

                          ///categories
                          const SHomeCategory(),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    //new books
                    Column(
                      children: [
                        Container(
                          color: darkMode ? SColors.darkerGrey : SColors.white,
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return const ShimmerEffect(width: double.infinity, height: 170, radius: 0,);
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: SSectionHeading(
                                    title: 'New Books',
                                    onPressed: () => Get.to(() => const AllNewBooksProducts()),
                                  ),
                                ),
                                Lottie.asset(
                                  'assets/animations/homeScreen_5.0.json',
                                  height: 150,
                                  width: double.infinity,
                                  repeat: true,
                                  reverse: true,
                                ),
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: TSizes.defaultSpace / 2,
                              bottom: TSizes.defaultSpace,
                              top: TSizes.defaultSpace / 2),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 150,
                                child: Obx(
                                      () {
                                    if (controller.isLoading.value) {
                                      return const SProductCardHorizontalShimmer();
                                    }
                                    if (controller.fetchBooks.isEmpty) {
                                      return Center(
                                          child: Text('No data found!',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .apply(color: Colors.white)));
                                    }
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: controller.fetchBooks.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                      const SizedBox(width: TSizes.spaceBtwItems),
                                      itemBuilder: (context, index) =>
                                          SProductCardHorizontal(
                                            newBooksModel: controller.fetchBooks[index],
                                          ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    //top books
                    Column(
                      children: [
                        Container(
                          color: darkMode ? SColors.darkerGrey : SColors.white,
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return const ShimmerEffect(width: double.infinity, height: 170, radius: 0,);
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: SSectionHeading(
                                    title: 'Top Books',
                                    onPressed: () => Get.to(() => const AllTopBooksProducts()),
                                  ),
                                ),
                                Lottie.asset(
                                  'assets/animations/homeScreen_6.0.json',
                                  height: 150,
                                  width: double.infinity,
                                  repeat: true,
                                  reverse: true,
                                ),
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: TSizes.defaultSpace / 2,
                              right: TSizes.defaultSpace / 2),
                          child: Column(
                            children: [
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Obx(
                                    () {
                                  if (topBookController.isLoading.value) {
                                    return SGridLayout(
                                      itemCount: 10, // Provide a dummy itemCount
                                      itemBuilder: (_, index) =>
                                          Container(), // Provide a dummy itemBuilder
                                      shimmer: true, // Set shimmer flag to true
                                    );
                                  } else if (topBookController.fetchBooks.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'No data found!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .apply(color: Colors.white),
                                      ),
                                    );
                                  } else {
                                    return SGridLayout(
                                      itemCount: topBookController.fetchBooks.length,
                                      itemBuilder: (_, index) => SProductCardVertical(
                                        topBooksModel:
                                        topBookController.fetchBooks[index],
                                      ),
                                    );
                                  }
                                },
                              ),

                              //SProductCardVertical(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

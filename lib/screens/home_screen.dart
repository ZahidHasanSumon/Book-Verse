import 'package:book_verse/helpers/helper_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/new_book_controller.dart';
import '../shimmer/shimmer.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/text.dart';
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
    final drakMode = SHelperFunctions.isDarkMode(context);
    final controller = Get.put(NewBookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SPromoSlider(),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                ///popular Categories
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ///heading
                      SSectionHeading(
                        title: STexts.pCategory,
                        showActionButton: false,
                        textColor: drakMode ? Colors.white : Colors.black,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      ///categories
                      const SHomeCategory(),
                    ],
                  ),
                ),
              ],
            ),
            //new books
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Heading
                  SSectionHeading(
                    title: 'New Books',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: Obx(() {
                      if(controller.isLoading.value){
                        return const ShimmerEffect(width: double.infinity, height: 200,);
                        //return const HorizontalShimmer();
                      }
                      if (controller.fetchBooks.isEmpty) {
                        return Center(
                            child: Text('No data found!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: Colors.white)));
                      }
                      return  ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.fetchBooks.length, // Replace 'yourController' with your actual controller
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                        const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) => SProductCardHorizontal(newBooksModel: controller.fetchBooks[index],), // Remove 'const' here
                      );
                    }
                    ),
                  )
                ],
              ),
            ),
            //top books
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Heading
                  SSectionHeading(
                    title: 'Top Books',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SGridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) => const SProductCardVertical(),
                  ),
                  //SProductCardVertical(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

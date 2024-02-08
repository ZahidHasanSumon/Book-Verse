import 'package:book_verse/controller/banner_controller.dart';
import 'package:book_verse/shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/circular_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';

class SPromoSlider extends StatelessWidget {
  const SPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        // Display shimmer effect when data is loading
        return CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
          ),
          items: List.generate(
            5, // Assuming 5 placeholders while loading
                (index) => const ShimmerEffect(width: double.infinity, height: 190),
          ),
        );
      }

      if (controller.banners.isEmpty) {
        // Display message if no data found
        return Center(
          child: Text(
            'No data found!',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      } else {
        // Display carousel slider with banners
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) => controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map(
                    (banner) => Builder(
                  builder: (BuildContext context) {
                    return SRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      SCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 5),
                        backgroundColor: controller.carouselCurrentIndex.value == i
                            ? SColors.primary
                            : SColors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}


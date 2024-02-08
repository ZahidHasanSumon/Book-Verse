import 'package:flutter/material.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/product_title_text.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/images_path.dart';
import '../utils/values/shadow.dart';

class SProductCardVertical extends StatelessWidget {
  const SProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return GestureDetector(
      //onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.white,
            border: Border.all(
              color: SColors.darkGrey,
              width: 1,
            )
        ),
        child: Column(
          children: [
            ///Thumbnail, Wishlist, Discount tag
            SRoundedContainer(
              height: 170,
              width: 180,
            //  padding: const EdgeInsets.all(TSizes.sm),
              bgColor: dark ? SColors.dark : SColors.light,
              child: const SRoundedImage(
                imageUrl: SImages.harryporter1,
                applyImageRadius: true,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            ///Details
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SProductTitleText(
                    title: 'Name of the Book',
                    smallSize: true,
                  ),

                  SProductTitleText(
                    title: 'Author name',
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  SProductTitleText(
                    title: 'If the issue persists, and you are still facing problems with the image fitting into the container',
                    smallSize: true,
                  ),

                ],
              ),
            ),
            const Spacer(),
           // const SizedBox(height: TSizes.spaceBtwItems / 2),

          ],
        ),
      ),
    );
  }
}

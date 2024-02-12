import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/shadow.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({super.key});


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
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: dark ? Colors.grey[850]! : Colors.grey[850]!,
          highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
          child: Column(
            children: [
              SRoundedContainer(
                height: 170,
                width: 180,
                bgColor: dark ? SColors.dark : SColors.light,

              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(height: TSizes.spaceBtwItems / 2),

                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

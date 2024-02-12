import 'package:book_verse/utils/custom_themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/values/shadow.dart';

class SProductCardHorizontalShimmer extends StatelessWidget {
  const SProductCardHorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Container(
      width: 325,
     // padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [SShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? SColors.darkerGrey : SColors.lightContainer,
        border: Border.all(
          color: SColors.darkGrey, // Set the color of the border
          width: 1.0, // Set the width of the border
        ),
      ),
      child: Row(
        children: [
          ///thumbnail
          SRoundedContainer(
            height: 150,
          //  padding: const EdgeInsets.all(TSizes.sm / 2),
            bgColor: SColors.light,
            radius: 16,
            child: Shimmer.fromColors(
              baseColor: dark ? Colors.grey[850]! : Colors.grey[850]!,
              highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
              child: Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          ///details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 120,
                        child: Shimmer.fromColors(
                          baseColor:
                              dark ? Colors.grey[850]! : Colors.grey[850]!,
                          highlightColor:
                              dark ? Colors.grey[700]! : Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 100,
                        child: Shimmer.fromColors(
                          baseColor:
                              dark ? Colors.grey[850]! : Colors.grey[850]!,
                          highlightColor:
                              dark ? Colors.grey[700]! : Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      SizedBox(
                        height: 20,
                        child: Shimmer.fromColors(
                          baseColor:
                              dark ? Colors.grey[850]! : Colors.grey[850]!,
                          highlightColor:
                              dark ? Colors.grey[700]! : Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

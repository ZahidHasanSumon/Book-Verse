import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/sizes.dart';

class SVerticalImagesText extends StatelessWidget {
  const SVerticalImagesText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SColors.white,
    this.backgroundColor,
    this.onPressed,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? SColors.dark : SColors.white),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: SColors.darkGrey, // Set the color of the border
                  width: 1.0, // Set the width of the border
                ),
              ),
              child: Center(
                child: SvgPicture.network(
                  image,
                  fit: BoxFit.cover,
                  color: dark ? SColors.white : SColors.dark,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: dark ? SColors.white : SColors.dark,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

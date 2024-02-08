import 'package:book_verse/shimmer/shimmer.dart';
import 'package:book_verse/utils/custom_themes/sizes.dart';
import 'package:flutter/cupertino.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              ShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}

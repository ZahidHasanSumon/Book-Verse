import 'package:book_verse/shimmer/shimmer.dart';
import 'package:book_verse/utils/custom_themes/sizes.dart';
import 'package:flutter/cupertino.dart';

class HorizontalShimmer extends StatelessWidget {
  const HorizontalShimmer({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            itemCount: itemCount,
            itemBuilder: (_, __) {
              return SizedBox(
                width: constraints.maxWidth / itemCount,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(
                      width: double.infinity,
                      height: 150,
                      radius: 20,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    ShimmerEffect(width: 172, height: 15),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


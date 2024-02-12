import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package
import '../helpers/helper_func.dart';
import '../utils/custom_themes/sizes.dart';

class SGridLayout extends StatelessWidget {
  const SGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
    this.border,
    this.shimmer = false, // Add a shimmer flag
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;
  final Border? border;
  final bool shimmer; // Shimmer flag

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    if (shimmer) {
      // Return shimmer effect
      return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[850]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!, // Customize highlight color
        child: GridView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: TSizes.gridViewSpacing,
            crossAxisSpacing: TSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent,
          ),
          itemBuilder: (context, index) => Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white, // Customize shimmer box color
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    } else {
      // Return regular SGridLayout
      return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder,
      );
    }
  }
}

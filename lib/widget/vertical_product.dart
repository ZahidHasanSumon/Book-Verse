import 'package:book_verse/widget/productcard_vertical.dart';
import 'package:book_verse/widget/section_heading.dart';
import 'package:flutter/material.dart';
import '../utils/custom_themes/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SSectionHeading(title: 'Sport Shoes', onPressed: () {}),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
         SizedBox(
            height: 120,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
              const SizedBox(width: TSizes.spaceBtwItems),
              itemBuilder: (context, index) =>
              const SProductCardVertical(),
            ),
          ),
        ],
      ),

    );
  }
}


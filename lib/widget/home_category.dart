import 'package:book_verse/controller/category_controller.dart';
import 'package:book_verse/shimmer/category_shimmer.dart';
import 'package:book_verse/widget/popular_category.dart';
import 'package:book_verse/widget/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SHomeCategory extends StatelessWidget {
  const SHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if(categoryController.isLoading.value){
        return const CategoryShimmer();
      }
      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return SVerticalImagesText(
              image: category.image,
              title: category.name,
              onPressed: () => Get.to(
                  () => PopularCategoryGrid(name: category.name),
            ),
            );
          },
        ),
      );
    });
  }
}

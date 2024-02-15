import 'package:book_verse/controller/popular_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/sizes.dart';
import '../widget/grid_layout.dart';
import '../widget/newBooks_vertical.dart';

class PopularCategoryGrid extends StatelessWidget {
  const PopularCategoryGrid({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularCategoryController(name));

    return Scaffold(
      appBar: const SAppBar(
        title: Text('Popular Category'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SGridLayout(
              itemCount: 10, // Provide a dummy itemCount
              itemBuilder: (_, index) =>
                  Container(), // Provide a dummy itemBuilder
              shimmer: true, // Set shimmer flag to true
            ),
          );
        } else if (controller.fetchBooks.isEmpty) {
          return const Center(
            child:
                Text('No data found!', style: TextStyle(color: Colors.white)),
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SGridLayout(
              itemCount: controller.fetchBooks.length,
              itemBuilder: (_, index) => NewBooksCardVertical(
                  newBooksModel: controller.fetchBooks[index]),
            ),
          );
        }
      }),
    );
  }
}

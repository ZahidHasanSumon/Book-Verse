import 'package:book_verse/controller/top_books_controller.dart';
import 'package:book_verse/widget/top_books_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/sizes.dart';
import '../widget/grid_layout.dart';

class AllTopBooksProducts extends StatelessWidget {
  const AllTopBooksProducts({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopBookController());

    return Scaffold(
      appBar: const SAppBar(
        title: Text('Top Books'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return SGridLayout(
            itemCount: 10, // Provide a dummy itemCount
            itemBuilder: (_, index) => Container(), // Provide a dummy itemBuilder
            shimmer: true, // Set shimmer flag to true
          );
        } else if (controller.fetchBooks.isEmpty) {
          return const Center(
            child: Text('No data found!', style: TextStyle(color: Colors.white)),
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SGridLayout(
              itemCount: controller.fetchBooks.length,
              itemBuilder: (_, index) => TopBooksCardVertical(topBooksModel: controller.fetchBooks[index]),
            ),
          );
        }
      }),
    );
  }
}

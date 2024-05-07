import 'package:book_verse/controller/all_books_controller.dart';
import 'package:book_verse/widget/library_allBooks.dart';
import 'package:book_verse/widget/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controller/connectivity_controller.dart';
import '../utils/custom_themes/sizes.dart';
import '../widget/grid_layout.dart';
import 'NoInternetToast.dart';

class LibraryDetails extends StatelessWidget {
  const LibraryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllBookController());
    final ConnectivityController connectivityController = Get.find<ConnectivityController>();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.md),
          child: Text('All Books'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: IconButton(
              onPressed: () {
                Get.to(const SearchPage());
              },
              icon: const Icon(Iconsax.search_normal),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace / 2, right: TSizes.defaultSpace / 2),
        child: Column(
          children: [
            // const SizedBox(height: 15),

            ///Searchbar
            // SSearchContainer(
            //   text: STexts.search,
            //   padding: const EdgeInsets.all(0.0),
            //   onTab:  () {
            //     Get.to(const earchPage());
            //   },
            // ),
            //const SizedBox(height: TSizes.spaceBtwSections),
            Obx(
              () {
                if (!connectivityController.isConnected.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    NoInternetToast.show(context);
                  });
                }
                if (controller.isLoading.value) {
                  return SGridLayout(
                    itemCount: 10, // Provide a dummy itemCount
                    itemBuilder: (_, index) =>
                        Container(), // Provide a dummy itemBuilder
                    shimmer: true, // Set shimmer flag to true
                  );
                } else if (controller.fetchBooks.isEmpty) {
                  return Center(
                    child: Text(
                      'No data found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      SGridLayout(
                          itemCount: controller.fetchBooks.length,
                          itemBuilder: (_, index) => LibraryAllBooks(
                                booksModel: controller.fetchBooks[index],
                              )),
                      const SizedBox(
                        height: TSizes.gridViewSpacing,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

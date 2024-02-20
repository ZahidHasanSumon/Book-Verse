import 'package:book_verse/controller/all_books_controller.dart';
import 'package:book_verse/widget/library_allBooks.dart';
import 'package:book_verse/widget/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/search_bar.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/text.dart';
import '../widget/grid_layout.dart';

class LibraryDetails extends StatelessWidget {
  const LibraryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllBookController());
    return Scaffold(
      appBar: const SAppBar(
        title: Text('All Books'),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace/2, right: TSizes.defaultSpace/2),
        child: Column(
          children: [
            // const SizedBox(height: 15),

            ///Searchbar
            SSearchContainer(
              text: STexts.search,
              padding: const EdgeInsets.all(0.0),
              onTab:  () {
                Get.to(const SearchPage());
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Obx((){
              if (controller.isLoading.value) {
                return SGridLayout(
                  itemCount: 10, // Provide a dummy itemCount
                  itemBuilder: (_, index) => Container(), // Provide a dummy itemBuilder
                  shimmer: true, // Set shimmer flag to true
                );
              } else if (controller.fetchBooks.isEmpty) {
                return Center(
                  child: Text(
                    'No data found!',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                  ),
                );
              }else{
                return Column(
                  children: [
                    SGridLayout(
                        itemCount: controller.fetchBooks.length,
                        itemBuilder: (_, index) => LibraryAllBooks( booksModel: controller.fetchBooks[index],)),

                    const SizedBox(height: TSizes.gridViewSpacing,),


                  ],
                );

              }

            },),

          ],
        ),
      ),
    );
  }
}

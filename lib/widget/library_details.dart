import 'package:flutter/material.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/search_bar.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/text.dart';
import '../widget/grid_layout.dart';
import '../widget/productcard_vertical.dart';
import 'newBooks_vertical.dart';

class LibraryDetails extends StatelessWidget {
  const LibraryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('All Books'),
        showBackArrow: false,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace),
        child: Column(
          children: [
           // const SizedBox(height: 15),

            ///Searchbar
             const SSearchContainer(text: STexts.search, padding: EdgeInsets.all(0.0),),
             const SizedBox(height: TSizes.spaceBtwSections),
            SGridLayout(itemCount: 30, itemBuilder: (_, index) => const NewBooksCardVertical()),
          ],
        ),
      ),
    );
  }
}



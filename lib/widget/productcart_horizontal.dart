import 'package:book_verse/utils/models/newbooks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/product_title_text.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/shadow.dart';
import 'book_details.dart';

class SProductCardHorizontal extends StatelessWidget {
  const SProductCardHorizontal({super.key, this.newBooksModel});

  final NewBooksModel? newBooksModel;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    final images = newBooksModel!.imageUrl;
    final String bookName = newBooksModel!.bookName;
    final String author = newBooksModel!.author;
    final String description = newBooksModel!.description;
    final String pdfUrl = newBooksModel!.pdfUrl;

    return GestureDetector(
      onTap: () => Get.to(
        () => BookDetailsScreen(
            image: images,
            bookName: bookName,
            author: author,
            description: description,
            pdfUrl: pdfUrl,),
      ),
      child: Container(
        width: 315,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.lightContainer,
          border: Border.all(
            color: SColors.darkGrey, // Set the color of the border
            width: 1.0, // Set the width of the border
          ),
        ),
        child: Row(
          children: [
            ///thumbnail
            SRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm / 2),
              bgColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: 120,
                    child: SRoundedImage(
                        height: 150,
                        fit: BoxFit.cover,
                        imageUrl: newBooksModel!.imageUrl,
                        isNetworkImage: true,
                        applyImageRadius: true),
                  ),
                ],
              ),
            ),

            ///details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SProductTitleText(
                          title: newBooksModel!.bookName,
                          smallSize: true,
                          bold: true,
                        ),
                        SProductTitleText(
                          title: newBooksModel!.author,
                          smallSize: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        SProductTitleText(
                          title: newBooksModel!.description,
                          smallSize: true,
                          maxLine: 5,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:book_verse/widget/book_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/product_title_text.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/models/newbooks_model.dart';
import '../utils/values/shadow.dart';

class LibraryAllBooks extends StatelessWidget {
  const LibraryAllBooks({super.key, this.booksModel});
  final NewBooksModel? booksModel;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final images = booksModel!.imageUrl;
    final String bookName = booksModel!.bookName;
    final String author = booksModel!.author;
    final String description = booksModel!.description;
    final String pdfUrl = booksModel!.pdfUrl;
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
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [SShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? SColors.darkerGrey : SColors.white,
            border: Border.all(
              color: SColors.darkGrey,
              width: 1,
            )),
        child: Column(
          children: [
            ///Thumbnail, Wishlist, Discount tag
            SRoundedContainer(
              height: 170,
              width: 180,
              //  padding: const EdgeInsets.all(TSizes.sm),
              bgColor: dark ? SColors.dark : SColors.light,
              child: SRoundedImage(
                imageUrl: booksModel!.imageUrl,
                applyImageRadius: true,
                fit: BoxFit.cover,
                isNetworkImage: true,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SProductTitleText(
                    title: booksModel!.bookName,
                    smallSize: true,
                    maxLine: 1,
                  ),
                  SProductTitleText(
                    title: booksModel!.author,
                    smallSize: true,
                    maxLine: 1,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SProductTitleText(
                    title:  booksModel!.description,
                    smallSize: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // const SizedBox(height: TSizes.spaceBtwItems / 2),
          ],
        ),
      ),
    );
  }
}

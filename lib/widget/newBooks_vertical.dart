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

class NewBooksCardVertical extends StatelessWidget {
  const NewBooksCardVertical({super.key, this.newBooksModel});
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
      onTap: () => Get.to(() => BookDetailsScreen(
          image: images,
          bookName: bookName,
          author: author,
          description: description,
          pdfUrl: pdfUrl,),),
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
            )
        ),
        child: Column(
          children: [
            ///Thumbnail, Wishlist, Discount tag
            SRoundedContainer(
              height: 170,
              width: 180,
              //  padding: const EdgeInsets.all(TSizes.sm),
              bgColor: dark ? SColors.dark : SColors.light,
              child: SRoundedImage(
                imageUrl: newBooksModel!.imageUrl,
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
                    title: newBooksModel!.bookName,
                    smallSize: true,
                    maxLine: 1,
                  ),

                  SProductTitleText(
                    title: newBooksModel!.author,
                    smallSize: true,
                    maxLine: 1,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SProductTitleText(
                    title: newBooksModel!.description,
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

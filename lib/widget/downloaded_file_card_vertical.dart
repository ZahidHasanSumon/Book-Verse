import 'package:book_verse/widget/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/product_title_text.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';
import '../utils/values/shadow.dart';

class DownloadedFileCardVertical extends StatelessWidget {
  const DownloadedFileCardVertical({super.key, this.fileName, this.filePath});

  final String ? fileName, filePath;


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
            () => PdfViewer(fileName: fileName.toString(), filePath: filePath.toString()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                child: const SRoundedImage(
                  imageUrl: 'assets/images/pdf.png',
                  applyImageRadius: true,
                  fit: BoxFit.cover,
                  isNetworkImage: false,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              ///Details
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SProductTitleText(
                      title: fileName.toString(),
                      smallSize: true,
                      maxLine:2,
                      bold: true,
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                  ],
                ),
              ),
              const Spacer(),
              // const SizedBox(height: TSizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}

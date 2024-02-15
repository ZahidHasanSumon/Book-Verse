import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path_provider/path_provider.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/product_title_text.dart';
import '../utils/custom_themes/rounded_container.dart';
import '../utils/custom_themes/rounded_images.dart';
import '../utils/custom_themes/sizes.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    super.key,
    required this.image,
    required this.bookName,
    required this.author,
    required this.description,
    required this.pdfUrl,
  });

  final String image, bookName, author, description, pdfUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SRoundedContainer(
                      height: 300,
                      width: double.infinity,
                      bgColor: SColors.primary,
                      child: SRoundedImage(
                        imageUrl: image,
                        applyImageRadius: true,
                        fit: BoxFit.cover,
                        isNetworkImage: true,
                        leadingIcon: Iconsax.arrow_circle_left5,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SProductTitleText(
                          title: bookName,
                          smallSize: false,
                          maxLine: 2,
                          bold: true,
                        ),
                        SProductTitleText(
                          title: author,
                          smallSize: true,
                          maxLine: 2,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        SProductTitleText(
                          title: description,
                          smallSize: true,
                          maxLine: 50,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add onPressed logic here
                    downloadFile(context, pdfUrl, bookName);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(SColors.primary),
                  ),
                  child: const Text(
                    'Download',
                    style: TextStyle(
                      color: SColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//final file = File('${dir.path}/${ref.name}');


Future downloadFile(context, String pdfUrl, String bookName) async {
  if (pdfUrl.isNotEmpty) {
    try {
      final externalDir = await getExternalStorageDirectory();
      final filePath = '${externalDir!.path}/$bookName.pdf';
      final file = File(filePath);

      // Check if the file already exists
      if (await file.exists()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File already exists')),
        );
        return; // Exit the function if file exists
      }

      // Show a dialog with a simple message "Downloading"
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dialog from being dismissed
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: SColors.primary,
                ),
                SizedBox(height: 16), // Add some spacing
                Text(
                  'Downloading...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );

// Download the file
      await Dio().download(
        pdfUrl,
        filePath,
        onReceiveProgress: (received, total) {
          // Update the progress indicator
          if (total != -1) {
            // Ensure that total is not -1 to avoid division by zero
            //double progress = (received / total * 100);
            //print('Download progress: $progress%');
          }
        },
      );

      Navigator.pop(context); // Dismiss the progress dialog

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Downloaded file'),),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error downloading file: $e");
      }
      Navigator.pop(context); // Dismiss the progress dialog if an error occurs
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download file')),
      );
    }
  } else {
    // Handle case when pdfUrl is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not find the file')),
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/device_utility.dart';
import '../utils/custom_themes/sizes.dart';
import 'book_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchPage> {
  var searchName = "";

  @override
  Widget build(BuildContext context) {
    final darkMode = SHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //SizedBox(height: 10), // Add space before the AppBar
            SAppBar(
              showBackArrow: false,
              centerTitle: true,
             // padding: EdgeInsets.zero,
              title: SizedBox(
                height: 50,
                width: SDeviceUtils.getScreenWidth(context),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchName = value.toLowerCase();
                      final excludedWords = ["a", "an", "and"];
                      searchName = value.toLowerCase().replaceAllMapped(
                        RegExp(r'\b\w+\b'),
                            (match) {
                          final word = match.group(0)!;
                          return excludedWords.contains(word) ? word : word.substring(0, 1).toUpperCase() + word.substring(1);
                        },
                      );
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLG),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                   // filled: true,
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Iconsax.search_normal,
                      color: darkMode ? SColors.white : SColors.darkerGrey,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('AllBooks')
                    .where('BookName', isGreaterThanOrEqualTo: searchName)
                    .where('BookName', isLessThanOrEqualTo: '$searchName\uf8ff')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Searching...");

                  }
                  const SizedBox(height: 10);
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return ListTile(
                        onTap: () => Get.to(
                              () => BookDetailsScreen(
                            image: data['ImageUrl'],
                            bookName: data['BookName'],
                            author: data['Author'],
                            description: data['Description'],
                            pdfUrl: data['PdfUrl'],),
                        ),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(data['ImageUrl']),
                        ),
                        title: Text(data['BookName']),
                        subtitle: Text(data['Author']),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// final images = booksModel!.imageUrl;
// final String bookName = booksModel!.bookName;
// final String author = booksModel!.author;
// final String description = booksModel!.description;
// final String pdfUrl = booksModel!.pdfUrl;
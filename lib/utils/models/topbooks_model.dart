import 'package:cloud_firestore/cloud_firestore.dart';


class TopBooksModel {
  String imageUrl, author, bookName, description, tag, categoryId, pdfUrl;
  int id;

  TopBooksModel({
    required this.id,
    required this.categoryId,
    required this.imageUrl,
    required this.author,
    required this.bookName,
    required this.description,
    required this.tag,
    required this.pdfUrl,
  });


  ///convert models to json
  Map<String, dynamic> toJson() {
    return {
      'CategoryId': categoryId,
      'Id': id,
      'ImageUrl': imageUrl,
      'Author': author,
      'Description': description,
      'BookName': bookName,
      'Tag': tag,
      'PdfUrl': pdfUrl,

    };
  }

  factory TopBooksModel.fromSnapshot(DocumentSnapshot snapshot) {

    final data = snapshot.data() as Map<String, dynamic>;
    // print('Snapshot data: $data');

    return TopBooksModel(
      imageUrl: data['ImageUrl'] ?? '',
      author: data['Author'] ?? '',
      description: data['Description'] ?? '',
      bookName: data['BookName'] ?? '',
      tag: data['Tag'] ?? '',
      pdfUrl: data['PdfUrl'] ?? '',
      id: data['Id'] ?? 0,
      categoryId: data['CategoryId'] ?? 0,
    );

  }
}

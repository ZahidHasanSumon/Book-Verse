import 'package:cloud_firestore/cloud_firestore.dart';


class NewBooksModel {
  String imageUrl, author, bookName, description;
  int id, categoryId;

  NewBooksModel({
    required this.id,
    required this.categoryId,
    required this.imageUrl,
    required this.author,
    required this.bookName,
    required this.description,
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

    };
  }

  factory NewBooksModel.fromSnapshot(DocumentSnapshot snapshot) {

    final data = snapshot.data() as Map<String, dynamic>;
   // print('Snapshot data: $data');

    return NewBooksModel(
      imageUrl: data['ImageUrl'] ?? '',
      author: data['Author'] ?? '',
      description: data['Description'] ?? '',
      bookName: data['BookName'] ?? '',
      id: data['Id'] ?? 0,
      categoryId: data['CategoryId'] ?? 0,
    );

  }
}

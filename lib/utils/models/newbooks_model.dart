import 'package:cloud_firestore/cloud_firestore.dart';


class NewBooksModel {
  String imageUrl, author, bookName, description;

  NewBooksModel({
    required this.imageUrl,
    required this.author,
    required this.bookName,
    required this.description,
  });


  ///convert models to json
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Author': author,
      'Description': description,
      'BookName': bookName,

    };
  }

  factory NewBooksModel.fromSnapshot(DocumentSnapshot snapshot) {

    final data = snapshot.data() as Map<String, dynamic>;

    return NewBooksModel(
      imageUrl: data['ImageUrl'] ?? '',
      author: data['Author'] ?? '',
      description: data['Description'] ?? '',
      bookName: data['BookName'] ?? '',
    );



  }
}

import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryModels {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModels({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  /// empty helper func
  static CategoryModels empty() =>
      CategoryModels(id: '', name: '', image: '', isFeatured: false);

  ///convert models to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  factory CategoryModels.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModels(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
      );
    }else{
      return CategoryModels.empty();
    }
  }
}

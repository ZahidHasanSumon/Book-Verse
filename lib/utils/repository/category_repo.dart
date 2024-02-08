import 'package:book_verse/utils/custom_alert.dart';
import 'package:book_verse/utils/models/category_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepo extends GetxController {

  static CategoryRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModels>> getAllCategories() async{
    try{

      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModels.fromSnapshot(document)).toList();
      return list;

    } on FirebaseException catch(e){
      throw CustomAlert(title: "Error", message: e.toString());
    } on PlatformException catch(e){
      throw CustomAlert(title: "Error", message: e.toString());
    }catch (e){
      throw const CustomAlert(title: "Error", message: "Something went wrong. Please try again.");

    }
  }


}
import 'package:book_verse/utils/custom_alert.dart';
import 'package:book_verse/utils/models/newbooks_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllBookRepo extends GetxController {

  static AllBookRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;



Future<List<NewBooksModel>> fetchAllBooks() async{
  try{

   // final snapshot = await _db.collection('NewBooks').limit(15).get();
    final snapshot = await _db.collection('AllBooks').limit(50).get();
    final list = snapshot.docs.map((document) => NewBooksModel.fromSnapshot(document)).toList();
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
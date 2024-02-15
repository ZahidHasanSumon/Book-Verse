import 'package:book_verse/utils/custom_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/topbooks_model.dart';

class TopBookRepo extends GetxController {

  static TopBookRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<TopBooksModel>> fetchTopBooks() async{
    try{
      final snapshot = await _db.collection('AllBooks').where('Tag', isEqualTo: 'TopBooks').limit(30).get();
      final list = snapshot.docs.map((document) => TopBooksModel.fromSnapshot(document)).toList();
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
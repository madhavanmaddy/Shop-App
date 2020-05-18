import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getCategory() async{
    return await Firestore.instance.collection('category').getDocuments();
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getCategory() async{
    return await Firestore.instance.collection('category').getDocuments();
  }
  getaavin() async{
    return await Firestore.instance.collection('aavin').getDocuments();
  }
  getassai() async {
    return await Firestore.instance.collection('assai').getDocuments();
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getdata(String colname) async{
    return await Firestore.instance.collection(colname).getDocuments();
  }
}
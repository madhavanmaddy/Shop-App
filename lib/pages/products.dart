import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class productsPage extends StatefulWidget {
  String tag;
  productsPage(this.tag);
  @override
  _productsPageState createState() => _productsPageState(tag);
}

// ignore: camel_case_types
class _productsPageState extends State<productsPage> {
  String tag;
  _productsPageState(this.tag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation:0.0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Products')
            .where('tag', isEqualTo: tag)
            .orderBy('name',descending: false)
            .snapshots(),
        builder: (context, snapshots) {
          return snapshots.hasData
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshots.data.documents.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Firestore.instance.collection('users').document('ID').collection('cart').add({
                      'img':snapshots.data.documents[index]['img'],
                      'name':snapshots.data.documents[index]['name'],
                      'price':snapshots.data.documents[index]['price'],
                      'qty':'1',
                    });
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Added to Cart'),)
                    );
                  },
                                  child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            elevation: 15,
                            color: Colors.white,
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Column(
                                children: [
                                  Image.network(
                                    snapshots.data.documents[index]['img'],
                                    height: 80,
                                    cacheHeight: 80,
                                  ),
                                  Text(
                                    snapshots.data.documents[index]['name'],
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    "₹ " +
                                        snapshots.data.documents[index]['price']
                                            .toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                );
              })
              : CircularProgressIndicator();
        }),
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tradeapp/services/authservice.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
          child: StreamBuilder(
            stream: Firestore.instance.collection('cart').document('ID').collection(uid).snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
              ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //navigate to details page
                                },
                                child: Container(
                                  child: ClipRect(
                                      child: Image(
                                        image: NetworkImage(
                                        snapshot.data.documents[index]['image'],
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      snapshot.data.documents[index]['name'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '₹ ' +
                                          snapshot.data.documents[index]['price']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Quantity : ' +
                                        snapshot.data.documents[index]['qty']
                                            .toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                   
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(shape: BoxShape.rectangle),
                                      child: RaisedButton(
                                          color: Colors.white,
                                          child: Text(
                                            'Edit Order',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                          onPressed: () {
                                            // editorderdialog(index);
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                      ),
                                      onPressed: () {
                                        // crudObj.deletedata(uid,cart
                                        //   .documents[index].documentID);
                                        final snackBar = SnackBar(
                                          content: Text('Deleted item!'),
                                          action: SnackBarAction(
                                            label: 'Close',
                                            onPressed: () {},
                                          ),
                                        );

                                        Scaffold.of(context).showSnackBar(snackBar);
                                        // crudObj
                                        //     .getCartData(uid)
                                        //     .then((results) {
                                        //   setState(() {
                                        //     cart = results;
                                        //   });
                                        // });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                
              ): Center(child: CircularProgressIndicator(),);
            }
          ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tradeapp/services/crud.dart';

class milkproducts extends StatefulWidget {
  @override
  _milkproductsState createState() => _milkproductsState();
}

class _milkproductsState extends State<milkproducts> {
  crudMethods crudObj = new crudMethods();
  int temp, temp2, temp4, temp21;
  double temp1, temp31;
  QuerySnapshot aavin;
  QuerySnapshot assai;
  @override
  void initState() {
    crudObj.getaavin().then((results) {
      setState(() {
        aavin = results;
        temp = aavin.documents.length;
        if (temp % 2 == 0) {
          temp = temp * 113;
          temp1 = temp.toDouble();
        } else {
          // temp = projects.documents.length;
          temp = temp + 1;
          temp = temp * 113;
          temp1 = temp.toDouble();
        }
        // temp = projects.documents.length;
        // temp = temp * 113;
        // temp1 = temp.toDouble();
      });
    });
    crudObj.getassai().then((results) {
      setState(() {
        assai = results;
        temp21 = assai.documents.length;
        if (temp21 % 2 == 0) {
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        } else {
          // temp = projects.documents.length;
          temp21 = temp21 + 1;
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Aavin Milk Products',

                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      crudObj.getaavin().then((results) {
                        setState(() {
                          aavin = results;
                          temp = aavin.documents.length;
                          if (temp % 2 == 0) {
                            temp = temp * 113;
                            temp1 = temp.toDouble();
                          } else {
                            // temp = projects.documents.length;
                            temp = temp + 1;
                            temp = temp * 113;
                            temp1 = temp.toDouble();
                          }
                          // temp = projects.documents.length;
                          // temp = temp * 113;
                          // temp1 = temp.toDouble();
                        });
                      });
                    },
                  )
                ],
              ),
              aavingrid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Assai Milk Products',
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      crudObj.getassai().then((results) {
                        setState(() {
                          assai = results;
                          temp21 = assai.documents.length;
                          if (temp21 % 2 == 0) {
                            temp21 = temp21 * 120;
                            temp31 = temp21.toDouble();
                          } else {
                            // temp = projects.documents.length;
                            temp21 = temp21 + 1;
                            temp21 = temp21 * 120;
                            temp31 = temp21.toDouble();
                          }
                        });
                      });
                    },
                  )
                ],
              ),
              assaigrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget aavingrid() {
    return aavin != null
        ? SizedBox(
            height: temp31,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: aavin.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15),
                              Image.network(
                                aavin.documents[index].data['image'],
                              ),
                              Text(
                                aavin.documents[index].data['name'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹ ' +
                                    aavin.documents[index].data['price']
                                        .toString(),
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget assaigrid() {
    return assai != null
        ? SizedBox(
            height: temp31,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: assai.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Image.network(
                                    assai.documents[index].data['image']),
                              ),
                              SizedBox(height: 10),
                              Text(
                                assai.documents[index].data['name'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹ ' +
                                    assai.documents[index].data['price']
                                        .toString(),
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

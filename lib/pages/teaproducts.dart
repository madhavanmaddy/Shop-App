import 'package:flutter/material.dart';
import 'package:tradeapp/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class teaproducts extends StatefulWidget {
  @override
  _teaproductsState createState() => _teaproductsState();
}

class _teaproductsState extends State<teaproducts> {
  crudMethods crudObj = new crudMethods();
  int temp, temp2, temp4, temp21;
  double temp1, temp31;
  QuerySnapshot roses;
  QuerySnapshot chakra;
  @override
  void initState() {
    crudObj.getroses().then((results) {
      setState(() {
        roses = results;
        temp = roses.documents.length;
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
    crudObj.getchakra().then((results) {
      setState(() {
        chakra = results;
        temp21 = chakra.documents.length;
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
                    '3 Roses',

                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      crudObj.getaavin().then((results) {
                        setState(() {
                          roses = results;
                          temp = roses.documents.length;
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
              rosesgrid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Chakra Gold',
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      crudObj.getassai().then((results) {
                        setState(() {
                          chakra = results;
                          temp21 = chakra.documents.length;
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
              chakragrid(),
            ],
          ),
        ),
      ),
    );
  }
   Widget rosesgrid() {
    return roses != null
        ? SizedBox(
            height: temp1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: roses.documents.length,
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
                                roses.documents[index].data['image'],
                                height: 110.0,
                              ),
                              Text(
                                roses.documents[index].data['name'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹ ' +
                                    roses.documents[index].data['price']
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

  Widget chakragrid(){
    
    return chakra != null
        ? SizedBox(
            height: temp1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: chakra.documents.length,
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
                                chakra.documents[index].data['image'],
                                height: 110.0,
                              ),
                              Text(
                                chakra.documents[index].data['name'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹ ' +
                                    chakra.documents[index].data['price']
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
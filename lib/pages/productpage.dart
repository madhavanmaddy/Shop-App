import 'package:flutter/material.dart';

class productpage extends StatefulWidget {
  String name,image,desc;
  int price;
  productpage(this.name,this.image,this.desc,this.price);
  @override
  _productpageState createState() => _productpageState(name,image,desc,price);
}

class _productpageState extends State<productpage> {
  String name,image,desc;
  int price;
  _productpageState(this.name,this.image,this.desc,this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            SizedBox(height:50.0),
           Text(name,style:TextStyle(fontSize: 25.0)),
          SizedBox(height:20.0),
          Center(
                child: Material(
              elevation: 16.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),

                        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(image,
                height: 300.0,
                width: 300.0,              
                ),
              ),
            )
        
          ),
          SizedBox(height:30.0),
          Text('Price : ₹ ' + price.toString(),style: TextStyle(fontSize:20),)
          ],
        ),
      ),
    );
  }
}
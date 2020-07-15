import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradeapp/pages/cartpage.dart';
import 'package:tradeapp/pages/profilepage.dart';
import 'package:tradeapp/pages/signinpage.dart';
import 'package:tradeapp/services/crud.dart';
import 'pages/products.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SigninPage(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  crudMethods crudObj = new crudMethods();
  QuerySnapshot category;
  double temp31;
  int temp21;
  @override
  void initState() {
    crudObj.getdata('category').then((results) {
      setState(() {
        category = results;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    final headstyle = TextStyle(fontSize: sw * 0.06);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Ambika Traders',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(children: [
          Text('Sign In Page')
        ],),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text(
                greetings(),
                style: headstyle,
              ),
              SizedBox(height: 5.0),
              Text(
                'What do you want?',
                style: headstyle,
              ),
              SizedBox(height: 20.0),
               RaisedButton(
                        child: Text('Signin Page'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SigninPage()));
                        }),
                    RaisedButton(
                        child: Text('Profile Page'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                        }),
                    RaisedButton(
                        child: Text('Cart Page'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartPage()));
                        }),
                      RaisedButton(
                        child: Text('Aavin Milk'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => productsPage('Aavin Milk')));
                        }),
                      RaisedButton(
                        child: Text('Assai Milk'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => productsPage('Assai Milk')));
                        }), 
                        RaisedButton(
                        child: Text('Tea'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => productsPage('Tea')));
                        }), 
                        RaisedButton(
                        child: Text('Homam'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => productsPage('Homam')));
                        }),  
                         RaisedButton(
                        child: Text('Biscuit'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => productsPage('Biscuit')));
                        }),  
            ],
          ),
        ),
      ),
    );
  }
  String greetings() {
    var now;
    now = DateTime.now().hour;
    if (now < 12) {
      return 'Good morning,';
    } else if (now < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }
}

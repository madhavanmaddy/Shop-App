import 'package:flutter/material.dart';
import 'package:tradeapp/main.dart';
import 'package:tradeapp/pages/newuihome.dart';
import 'package:tradeapp/services/authservice.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/undraw_sign_in_e6hj.png',
            ),
            Text(
              'Login In Options',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.pop(context, true);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => MyHomePage()));
                });
              },
              child: Material(
                elevation: 16.0,
                shadowColor: Colors.grey,
                shape: StadiumBorder(),
                child: Container(
                  height: 50,
                  width: 180,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/1200px-Google__G__Logo.png',
                        height: 30,
                      ),
                      SizedBox(width: 15),
                      Text('Login Using Google'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

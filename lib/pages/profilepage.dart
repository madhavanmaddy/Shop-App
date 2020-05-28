import 'package:flutter/material.dart';
import 'package:tradeapp/pages/signinpage.dart';
import 'package:tradeapp/services/authservice.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          DetailsCard(),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          MiddleOne(),
          Container(height: 1, color: Colors.grey),
          OptionsList(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
  Widget MiddleOne() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 195,
          child: Center(child: Text('')),
        ),
        Container(
          height: 100,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 100,
          width: 195,
        ),
      ],
    );
  }

  Widget OptionsList() {
    return Container(
        height: 380,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Your Favourites',
                          style: TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Payment',
                          style:TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Tell Your Friend',
                          style: TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Promotions',
                          style: TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Settings',
                          style:TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      signOutGoogle().whenComplete(() {
                        Navigator.pop(context,
                            true); 
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                        );
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          color: Colors.red,
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Log out',
                          style: TextStyle(fontFamily:'Poppins',fontSize:20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget DetailsCard() {
    return Container(
      height: 250,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 20,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageurl),
              radius: 50,
            ),
          ),
          Positioned(
            left: 140,
            top: 50,
            child: Text(name,
                style: TextStyle(fontFamily:'Poppins',fontSize:20),),
          ),
          Positioned(left: 70, top: 155, child: Text(phonenumber)),
          Positioned(
            top: 150,
            left: 30,
            child: Icon(
              Icons.phone,
              color: Colors.grey,
            ),
          ),
          Positioned(left: 70, top: 205, child: Text(email)),
          Positioned(
              left: 30,
              top: 200,
              child: Icon(
                Icons.email,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}

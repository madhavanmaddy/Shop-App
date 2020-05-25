import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewUIhome extends StatefulWidget {
  @override
  _NewUIhomeState createState() => _NewUIhomeState();
}

class _NewUIhomeState extends State<NewUIhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Text(
              'DAIRY',
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.w600),
            )),
            Center(
              child: Text(
                'PURE.FRESH.ORGANIC',
                style: GoogleFonts.openSans(
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/1.jpg'),
            ),
            Text(
              'TOP CATEGORIES',
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffb3e5fc),
                    ),
                    height: 75,
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Image.asset(
                          'assets/Milk11.png',
                          scale: 0.1,
                          
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

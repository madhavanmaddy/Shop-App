import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradeapp/services/crud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
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
@override
void initState() {
  crudObj.getCategory().then((results){
    setState(() {
      category = results;
    });
  });
}
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    final headstyle = TextStyle(
      fontSize: sw*0.06
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
     body: SingleChildScrollView(
       child:Column(
         children: <Widget>[
           SizedBox(height: 30.0,),
         Text(
           greetings(),
           style: headstyle,
           ),
          Text(
            'What do you want?',
            style: headstyle,
            ),
            categorygrid(),
         ],
       ),
     ),
    );
  }

  Widget categorygrid(){
    return category!= null
    ? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
        ), 
      itemBuilder: (_,index){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: (){

            },
            child: Container(
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.blueAccent,
                 ),
               ]
             ),
             padding: EdgeInsets.symmetric(horizontal:5),
              child: Column(
                children: <Widget>[
                  category.documents[index].data['icon'],
                  SizedBox(height:5),
                  category.documents[index].data['text'],
              ],
              ),
            ),
          ),
        );
      }): Center(child: CircularProgressIndicator(),);
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

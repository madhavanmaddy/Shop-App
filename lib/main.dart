import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradeapp/services/crud.dart';
import 'package:tradeapp/pages/milkproducts.dart';
import 'pages/teaproducts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        'milkproducts':(_)=>milkproducts(),
        'teaproducts':(_)=>teaproducts(),
      },
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
     
    crudObj.getCategory().then((results) {
      setState(() {
        category = results;
        temp21 = category.documents.length;
        if (temp21 % 2 == 0) {
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        } else {
          // temp = projects.documents.length;
          temp21 = temp21 + 1;
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        }
        print('$temp31');
      });
    });

    super.initState();
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
        title: Text('Ambika Traders',style: TextStyle(
          fontSize: 20.0,
          color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: SingleChildScrollView(
         child:Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             SizedBox(height: 5.0,),
           Text(
             greetings(),
             style: headstyle,
             ),
             SizedBox(height:5.0),
            Text(
              'What do you want?',
              style: headstyle,
              ),
              SizedBox(height:20.0),
              categorygrid(),
              SizedBox(height:20.0),
           ],
         ),
       ),
     ),
    );
  }
  Widget categorygrid() {
    return category != null
        ? SizedBox(
            height: temp31,
            width: (MediaQuery.of(context).size.width)*0.90,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
              ),
              itemCount: category.documents.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.00, 3.00),
                          color: Color(0xff000000).withOpacity(0.09),
                          blurRadius: 30,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(33.00),
                    ),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, category.documents[index].data['path']);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal:8),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height:10),
                                  Container(
                                    child: Image.network(category.documents[index].data['image'],
                                    height: 130.0,
                                    width:130.0,
                                    ),
                                  ),
                                   Text(category.documents[index].data['name'],style: TextStyle(fontSize:20),),
                                ],
                              ),
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator(),);
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

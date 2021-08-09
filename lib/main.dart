import 'package:flutter/material.dart';
import 'Viewpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppBar(
              title: const Text('This is hearder',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              backgroundColor: Color(0xff1B2A47),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 200),
                child: Text('My name is Hoàng Duy. I am 22 years old.',
                    style: TextStyle(fontSize: 16))),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (
                    context) => Firstpage()));
              },
              child: Container(
                width: 223,
                height: 52,
                margin: const EdgeInsets.only(top: 50, bottom: 35),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff1B2A47),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "View page",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: 900,
          child: Text(
            'This is a footer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff1B2A47),
              fontSize: 20,
              letterSpacing: 1,
            ),
          ),
        )
      ],
    );
  }
}

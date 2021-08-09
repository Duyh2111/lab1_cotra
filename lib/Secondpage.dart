import 'package:flutter/material.dart';
import 'Thirdpage.dart';

/// This is the main application widget.
class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppBar(
              title: const Text('This is hearder',
                  style: TextStyle(color: Color(0xff9CA6B6), fontSize: 20)),
              backgroundColor: Color(0xff1B2A47),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text('This is a Giraffe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              alignment: Alignment.center,
              child: Container(
                width: 300.0,
                height: 500.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (
                    context) => Thirdpage()));
              },
              child: Container(
                width: 243,
                height: 52,
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
                    "Go the the third page",
                    textAlign: TextAlign.center,
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

/// This is the stateful widget that the main application instantiates.


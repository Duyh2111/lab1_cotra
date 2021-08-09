

import 'package:flutter/material.dart';
import 'main.dart';

class Thirdpage extends StatefulWidget {
  Thirdpage({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Thirdpage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('This is hearder',
            style: TextStyle(color: Color(0xff9CA6B6), fontSize: 20)),
        backgroundColor: Color(0xff1B2A47),
      ),
      body: Column(
          //Add this line onyour column
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: vehicles.length,
                  itemBuilder: (context, i) {
                    return new ExpansionTile(
                      title: new Text(
                        vehicles[i].title,
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      children: <Widget>[
                        new Column(
                          children: _buildExpandableContent(vehicles[i]),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'Username',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.lock),
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Container(
                                          width: 113,
                                          height: 52,
                                          child: Center(
                                            child: Text(
                                              "Submit",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff1B2A47),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  width: 113,
                  height: 52,
                  child: Center(
                    child: Text(
                      "Open Popup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1B2A47),
                      ),
                    ),
                  ),
                ),
                //  Text("Open Popup"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (
                    context) => Homepage()));
              },
              child: Container(
                width: 150,
                height: 52,
                margin: const EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
                    "Hone page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
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

  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(
            content,
            style: new TextStyle(fontSize: 18.0),
          ),
          leading: new Icon(vehicle.icon),
        ),
      );

    return columnContent;
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  new Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  new Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
];

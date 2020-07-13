

import 'package:covid/Auth/Register.dart';
import 'package:flutter/material.dart';

import '../Auth//AuthUi.dart';
import '../Auth/LoginPage.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Colors.amber,
                      Colors.blue,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.asset('assets/images/cinema.jpg',
          height: MediaQuery.of(context).size.height * 0.4,              width: MediaQuery.of(context).size.width * 0.4,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 5,),
            Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(                      borderRadius: new BorderRadius.circular(18.0),                      side: BorderSide(color: Colors.black)),
                  onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),);},
                  child: Text("Log",style: TextStyle(color: Colors.black),),

                )),

            Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),                      side: BorderSide(color: Colors.black)),
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),);},
                  child: Text("Register Now",style: TextStyle(color: Colors.black),),
                )),
          ],
        ),
        Text('Now! Quick login use Touch ID',
            style: TextStyle(
                color: Colors.white, fontWeight:
            FontWeight.bold)),
        Icon(
          Icons.fingerprint,
          color: Colors.white,
          size: 60,            ),
        Text('Use Touch ID',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,                )),
      ],
      ),
    ),    ));

    }}

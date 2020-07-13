import 'dart:async';

import 'package:covid/Home/MyHomePage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness){
      return ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Circular',
          brightness: brightness == Brightness.light
              ? Brightness.light
              : Brightness.dark,
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? Colors.blueGrey[900]
              : Colors.white);

      },
      themedWidgetBuilder: (context,theme){
     return   MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          home: MyHomePage(),
        );
      },


    );
  }}

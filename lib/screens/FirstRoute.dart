
import 'dart:convert';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid/panels/InfoPanel.dart';
import 'package:covid/panels/mosteffectedcountries.dart';
import 'package:covid/panels/worldwidepanel.dart';

import 'package:covid/screens/MainMenu.dart';
import 'package:covid/screens/Pays.dart';
import 'package:covid/services/datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData =json.decode(response.body);
    });

    }

  List countryData;
  fetchcountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData =json.decode(response.body);
    });

  }

    @override
  void initState() {
    fetchWorldWideData();
    fetchcountryData();
      super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MainMenu(),

      appBar: AppBar(actions: <Widget>[   IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
        DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
      })
      ],
        title: Text('C I N E M A  maroc'),

      ),
      body:SingleChildScrollView(child:Column(
        crossAxisAlignment: CrossAxisAlignment.start

        ,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(7),
            height: 100,
            color: Colors.orange,
            child: Text(dataSource.quote,style: TextStyle(
                color:Colors.black54,fontWeight: FontWeight.bold,fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text('T O P cinema ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pays()));
                  },
                  child: Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('4',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.greenAccent),)),
                ),

              ],
            ),
          ),



          worldData==null?CircularProgressIndicator():WorldwidePanel(worldData:worldData,),












        ],
      )),

      );

  }
}

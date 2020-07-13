import 'package:covid/panels/QST.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class InfoPanel  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>QST()));

      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black45,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("QST",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 19),),
                 Icon(Icons.play_arrow,color: Colors.greenAccent,)
               ],
             ),

            ),
            GestureDetector(
              onTap: (){
                launch('https://www.arcgis.com/apps/webappviewer/index.html?id=e37c7c47b163458faf0efb830890dbec');
              },
              child: Container(
                color: Colors.black45,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Text("covidmaroc",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 19),),
                    Icon(Icons.play_arrow,color: Colors.greenAccent,)
                  ],
                ),

              ),
            ),


            GestureDetector(
              onTap: () {
                launch('https://news.google.com/covid19/map?hl=fr&mid=%2Fg%2F11b7qwgb7g&gl=MA&ceid=MA%3Afr');
              },

                child: Container(
                  color: Colors.black45,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Text("principales actualités",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 19),),
                      Icon(Icons.play_arrow,color: Colors.greenAccent,)
                    ],
                  ),

                ),

            ),

          ],
        ),
      ),
    );
  }
}

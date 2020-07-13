import 'package:covid/screens/GalleryDetails.dart';
import 'package:flutter/material.dart';


class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyboard="";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(backgroundColor:Colors.deepOrange,title: Text(keyboard,style:TextStyle(backgroundColor: Colors.deepOrange),),),
        body: Column(
          children: <Widget>[
            Container(child: TextField(
              onChanged:(value){
                setState(() {
                  this.keyboard=value;
                });
              },
            ),padding: EdgeInsets.all(20),),
            Container(width: double.infinity,  child: RaisedButton(

              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetails(keyboard)));},
              color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text('clique me '),

            )),
          ],
        )
    );
  }
}

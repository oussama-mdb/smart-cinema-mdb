import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class GalleryDetails extends StatefulWidget {

  @override
  _GalleryDetailsState createState() => _GalleryDetailsState();
  String keyboard;
  GalleryDetails(this.keyboard);
}

class _GalleryDetailsState extends State<GalleryDetails> {
  int current=1;
  int size=5;
  List<dynamic> hits=[];
  var galleryData;
  @override
  void initState() {
    super.initState();
    this.getData();
  }
  getData(){
    String url="https://pixabay.com/api/?key=15937806-7a48fb67c50172523d8f8277d&q=${widget.keyboard}&page=${current}&per_page=${size}";
    http.get(url).then((resp){
      setState(() {
        galleryData=json.decode(resp.body);
        hits=galleryData['hits'];
        print(hits);
      });
    }).catchError((err){
      print(err);
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:
        Text(widget.keyboard,style: TextStyle(fontSize: 20),),),
        body:(galleryData==null?CircularProgressIndicator()
            :ListView.builder(
            itemCount: (galleryData==null?0:hits.length),
            itemBuilder: (context,index){
              return Column(children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child : Card(
                    child: Padding(padding: EdgeInsets.all(10),
                      child: Center(child: Text(hits[index]['tags'],
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    color: Colors.deepOrange,
                  ),
                ),
                Container(
                  //  //${widget.keyboard}&page=${current}&per_page=${size}";
                  child: Card(child: Image.network(hits[index]['webformatURL']),),
                )
              ],);
            }))
    );
  }
}

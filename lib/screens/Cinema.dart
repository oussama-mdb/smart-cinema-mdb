import 'package:covid/screens/Salle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Cinema extends StatefulWidget {
  dynamic ville;
  Cinema(this.ville);
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  List <dynamic>listCinams;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cinema de ${widget.ville['name']}'),),
      body: Center(

        child:this.listCinams==null?CircularProgressIndicator():
        ListView.builder(
          itemCount: (this.listCinams==null)?0:this.listCinams.length,
          itemBuilder: (context,index){
          return Card(
          child: RaisedButton(
            child: Text(this.listCinams[index]['name']),
            onPressed: (){
                Navigator.push(context,

                          MaterialPageRoute(builder: (context)=> Salle(listCinams[index]) ));
            },
          ),            
          );
        },
        )
      ),
      
      
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCinema();
      }
    
      void loadCinema() {
       String url=this.widget.ville['_links']['cinemas']['href'];
        http.get(url)
        .then((resp){
          setState(() {
            this.listCinams=json.decode(resp.body)['_embedded']['cinemas'];
          });

        }).catchError((err){
          print(err);

        });
      }
}
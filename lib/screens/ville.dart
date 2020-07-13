import 'package:covid/screens/Cinema.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Ville extends StatefulWidget {
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  List<dynamic> listVilles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Villes'),),
      body: Center(

        child:this.listVilles==null?CircularProgressIndicator():
        ListView.builder(
          itemCount: (this.listVilles==null)?0:this.listVilles.length,
          itemBuilder: (context,index){
          return Card(
          child: RaisedButton(
            child: Text(this.listVilles[index]['name']),
            onPressed: (){
               Navigator.push(context,

                          MaterialPageRoute(builder: (context)=> Cinema(listVilles[index]) ));
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
    loadVilles();
      }
    
      void loadVilles() {
        String url="http://192.168.1.2:9032/villes";
        http.get(url)
        .then((resp){
          setState(() {
            this.listVilles=json.decode(resp.body)['_embedded']['villes'];
          });

        }).catchError((err){
          print(err);
        });
  
      }
}

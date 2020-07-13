import 'package:covid/screens/ville.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'GolablVariable.dart';

class Salle extends StatefulWidget {
  dynamic cinema;
  Salle(this.cinema);
  @override
  _SalleState createState() => _SalleState();
}

class _SalleState extends State<Salle> {
  List<dynamic> listSalles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salle de cinema ${widget.cinema['name']}'),
      ),
      body: Center(

          child: this.listSalles == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount:
                      (this.listSalles == null) ? 0 : this.listSalles.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(


                          padding:const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(this.listSalles[index]['name']),
                            onPressed: () {
                              loadProjection(this.listSalles[index]);
                            },
                          ),
                          ),
                        ),

                         if(this.listSalles[index]['projections']!=null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.network(GlobalData.host+"/imagefilm/${this.listSalles[index]
                              ['currentProjection']['film']['id']}", width: 150,),
                                      Column(
                                        children: <Widget>[
                                          ...(this.listSalles[index]['projections'] as List<dynamic>).map((projection){
                                            return RaisedButton(
                                              color: (this.listSalles[index]['currentProjection']['id']==projection['id'])?Colors.red:Colors.blue,
                                              child: Text(
                                                "${projection['seance']['heureDebut']} (${projection['film']['duree']} heures, Prix= ${projection['prix']}",style: TextStyle(fontSize: 10),
                                              ),
                                              onPressed: (){
                                                loadTickets(projection,this.listSalles[index]);
                                              },
                                            );
                                          })
                                        ],
                                      )

                            ],
                          ),
                        ),
                        if(this.listSalles[index]['currentProjection']!=null &&
                            this.listSalles[index]['currentProjection']['listTickets']!=null &&
                            this.listSalles[index]['currentProjection']['listTickets'].length>0)
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Nombre de places Disponible ${this.listSalles[index]['currentProjection']['nombrePlacesDisponibles']}")
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 2, 6, 3),
                                child: TextField(
                                  decoration: InputDecoration(hintText: 'Ton Nom'),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 2, 6, 3),
                                child: TextField(
                                  decoration: InputDecoration(hintText: 'Code Payement'),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 2, 6, 3),
                                child: TextField(
                                  decoration: InputDecoration(hintText: 'Nombre de tickets'),),
                              ),
                              Container(
                                child: RaisedButton(
                                  color: Colors.indigo,
                                  child: Text("Réserver les places",style: TextStyle(color: Colors.white),),
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                          title: Text("Confirmation de Reservation"),
                                      content: Text("Confirmation "),
                                        actions: <Widget>[
                                      FlatButton(child: Text("yes"),
                                      onPressed: (){
                                        Navigator.push(context,

                                            MaterialPageRoute(builder: (context)=>Ville()));
                                      }
                                      ,),

                                          FlatButton(child: Text("non"),
                                            onPressed: (){

                                            


                                            }
                                            ,),

                                        ],
                                      );
                                    });
                                  },
                                ),
                              ),
                              Wrap(

                                children: <Widget>[
                                  ...this.listSalles[index]['currentProjection']['listTickets'].map((ticket){
                                    return Container(
                                      width: 50,
                                      padding: EdgeInsets.all(2),
                                      child: RaisedButton(
                                        color: Colors.deepOrange,

                                        child: Text("${ticket['place']['numero']}",
                                          style: TextStyle(color: Colors.white,fontSize: 12),),
                                        onPressed: () {


                                        },
                                      ),);

                                  }
                                  ),

                                ],

                              )
                            ],
                          )

                      ],
                    ));

                  },
                )),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSalle();
  }

  void loadSalle() {
    String url = this.widget.cinema['_links']['salles']['href'];
    http.get(url).then((resp) {
      setState(() {
        this.listSalles = json.decode(resp.body)['_embedded']['salles'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  void loadProjection(salle) {
    String url = salle['_links']['projections']['href'].toString()
.replaceAll("{?projection}", "?projection=p1");
    print(url);
    http.get(url).then((resp) {
      setState(() {
            salle['projections']=json.decode(resp.body)['_embedded']['projections'];
            salle['currentProjection']= salle['projections'][0];
            salle['currentProjection']['listTickets'] = [];
            print(salle['projections']);
      });

    }).catchError((err) {
      print(err);
    });
  }

  void loadTickets(projection,salle) {
    String url = projection['_links']['tickets']['href'].toString()
        .replaceAll("{?projection}", "?projection=t1");
    print(url);
    http.get(url).then((resp) {
      setState(() {
        projection['listTickets']=json.decode(resp.body)['_embedded']['tickets'];
        projection['nombrePlacesDisponibles']=nombrePlaceDisponible(projection);
        salle['currentProjection']= projection ;

      });

    }).catchError((err) {
      print(err);
    });
  }
  nombrePlaceDisponible(projection){
    int nombre=0;
    for(int i=0 ; i<projection['tickets'].length;i++){
      if(projection['tickets'][i]['reserve']==false) ++nombre;
    }
    return nombre;
  }


}

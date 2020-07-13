import 'package:covid/screens/Gallery.dart';
import 'package:covid/screens/Gio.dart';
import 'package:covid/screens/cinema.dart';
import '../screens/TotoGPS.dart';
import '../services/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covid/screens/ville.dart';



class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("OUSSAMA MOUADDAB"),
            accountEmail: new Text("oussamamouaddab@gmail.com"),
            currentAccountPicture: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'images/oussama.jpg',
                ),
              ),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'images/oussama.jpg',
                ),
              ),
            ],
            decoration: BoxDecoration(
                gradient:
                LinearGradient(colors: [Colors.red, Colors.deepPurple])),
          ),
          ListTile(
            title: Center(
                child: Text(
                  "position",
                  style: TextStyle(fontSize: 20),
                )),
  onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>TotoGPS()),
                              );
                            },
                            trailing: new Icon((Icons.arrow_forward)),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Center(
                                child: Text(
                                  "MAP ",
                                  style: TextStyle(fontSize: 20),
                                )),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>Gio()),
                              );
                            },
                
                            trailing: new Icon(Icons.arrow_forward),
                          ),
                          Divider(color: Colors.black),
                          ListTile(
                            title: Center(
                                child: Text(
                                  "gallery",
                                  style: TextStyle(fontSize: 20),
                                )),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gallery()),
                              );
                            },
                            trailing: new Icon(Icons.arrow_forward),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Center(
                                child: Text(
                                  "Ville",
                                  style: TextStyle(fontSize: 20),
                                )),
                                   onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Ville()),
                              );
                            },
                            trailing: new Icon(Icons.arrow_forward),
                          ),
                
                            Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Center(
                                child: Text(
                                  "Cinema",
                                  style: TextStyle(fontSize: 20),
                                )),
                                   onTap: () {
                             
                            },
                            trailing: new Icon(Icons.arrow_forward),
                          ),
                
                          
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  }
                }
                

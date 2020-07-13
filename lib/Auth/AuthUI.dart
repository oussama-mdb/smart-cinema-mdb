import 'package:flutter/material.dart';
class AuthUI extends StatefulWidget {

  @override
  _AuthUIState createState() => _AuthUIState();
}

class _AuthUIState extends State<AuthUI> {

  String email='';
  String password='';
  final _formKey=GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,

              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [
                Colors.grey,
                Colors.grey,
                Colors.red,
              ],
              ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                  )),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child:  Image.asset("assets/images/covid.jpg"),

                  ),
                  Align(
                      alignment: Alignment.bottomRight,

                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32, //dif mabin tswera ou ktaba
                            right: 45 // ktaba thayd mn janb
                        ),
                        child: Text(
                          "L O G I N",
                          style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ))

                ],),
            ),
            SizedBox(height: 20,),
            Container(
                child:Column(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 50,
                    padding: EdgeInsets.only(
                        top: 4,left: 16,right: 16,bottom: 4
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(40)
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26  ,


                            blurRadius: 28,
                          )
                        ]
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.blue,),
                          hintText: "d de Telephone"

                      ),
                      onChanged: (val){
                        setState((){
                          email=val;
                        });

                      },
                      validator: (val)=>val.isEmpty?"enter email":null,

                    ),

                  ),

                  Container(

                    height: 50,//tji lwast
                    width: MediaQuery.of(context).size.height/2.5,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16,right: 16,bottom: 4
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(40)
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26  ,


                            blurRadius: 28,
                          )
                        ]
                    ),

                  ),
                ],)

            )
          ],
        ),
      ),
      ),


    );
  }
}
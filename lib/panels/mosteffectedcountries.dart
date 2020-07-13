import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

    class MostAffectedPanel extends StatelessWidget {
      final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        return Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
             child: Row(
                children: <Widget>[
                Image.network(countryData[index]['countryInfo']['flag'],height: 33,),
                  SizedBox(height: 20,),

                  SizedBox(width: 20,),
                  Text(countryData[index]['country'],style: TextStyle(fontSize: 17),),
                  SizedBox(width: 20,),
                  Text('Deaths:' +countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 17),)
                ],
              )
            );
          },
            itemCount: 5,


          ),
        );
      }
    }
    

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
          shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 2),
    children: <Widget>[
    StatusPanel( title: 'cinema lynx ',
      panelColor: Colors.red,
      textColor: Colors.red,
      count: worldData['cases'].toString(),),

    StatusPanel( title: 'cinema megarama',
      panelColor: Colors.blue[100],
      textColor: Colors.blue,
        count: worldData['activePerOneMillion'].toString(),),
    StatusPanel( title: 'cinema imax',
      panelColor: Colors.green[100],
      textColor: Colors.green,
      ),
    StatusPanel( title: 'cinema rif',
      panelColor: Colors.black45,
      textColor: Colors.red,
      count: worldData['deaths'].toString(),
    ),
    ],
    ),
    );

  }
    }
    class StatusPanel extends StatelessWidget {
      final Color panelColor;
      final Color textColor;
      final String title;
      final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        return Container(
          margin: EdgeInsets.all(5),
          height: 80,width: width/2,
       color: panelColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
            Text(title,style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold,fontSize: 16),),

        ],
          ),
        );
      }
    }

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../util/Profile.dart';

/*
 * -----------------------------------------------
 * Profile Page
 * Contents:
 *
 *
 * -----------------------------------------------
 */
class ProfilePage extends StatefulWidget{


  const ProfilePage({
    Key? key,
    required this.pf,
  }) : super(key: key);

  ///Passed in profile
  final Profile pf;

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    List<charts.Series<VolumeHist, DateTime>> vol = [
      charts.Series(
          id: "volume",
          data: widget.pf.Volume_history,
          domainFn: (VolumeHist vol, _) => vol.MonthDay,
          measureFn: (VolumeHist vol, _) => vol.volume,
          colorFn: (VolumeHist vol, _) => vol.Barcolor
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pf.Users_name),
      ),
      body: 
      Stack( children : [
        ///Centered workout label
        const Align(
        alignment: Alignment.topCenter,
        child:
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text('Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
          ),
        ),
      ),

      ///Empty workout button
      const Align(
        alignment: Alignment.topCenter,
        child:
        Padding(
          padding: EdgeInsets.only(top: 120.0 ),
          child:
            Icon(Icons.account_circle,
              color: Colors.red,
              size: 75,
            ),
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child:
            Padding(
              padding: const EdgeInsets.only(top: 210.0),
              child:
                Text(widget.pf.Users_name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
            ),
        ),

        const Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 300.0),
            child:
            Text('Volume Chart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child:
            Padding(
              padding: EdgeInsets.only(top: 350),
              child:
                SizedBox(
                  width: 400,
                  height: 500,
                  child:
                    charts.TimeSeriesChart(vol,
                    dateTimeFactory: const charts.LocalDateTimeFactory(),
                    animate: true),
                ),
            )
        ),
      ]),
    );
  }
}
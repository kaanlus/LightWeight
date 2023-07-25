import 'package:flutter/material.dart';

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
      ]),
    );
  }
}
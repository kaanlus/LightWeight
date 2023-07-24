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
    );
  }
}
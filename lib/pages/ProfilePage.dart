import 'package:flutter/material.dart';
import 'package:lightweight/pages/HomePage.dart';

import '../util/Profile.dart';
class ProfilePage extends StatefulWidget{


  ProfilePage({
    Key? key,
    required this.pf,
  }) : super(key: key);
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
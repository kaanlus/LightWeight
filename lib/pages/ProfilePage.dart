import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget{


  ProfilePage({Key? key,}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{

  final String profilename = 'default user 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //button context workout number
          '$profilename\'s profile',
        ),
      ),
    );
  }
}
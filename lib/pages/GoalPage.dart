import 'package:flutter/material.dart';

import '../util/Profile.dart';

class GoalPage extends StatefulWidget {

  GoalPage({
    Key? key,
    required this.pf,
  }) : super(key: key);
  final Profile pf;

  @override
  GoalPageState createState() => GoalPageState();
}

class GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: Stack(
        children : [
          Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Goals',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),),),
        ]
      ),
    );
  }
}
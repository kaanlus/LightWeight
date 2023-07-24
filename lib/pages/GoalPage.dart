import 'package:flutter/material.dart';

import '../util/Profile.dart';

/*
 * -----------------------------------------------
 * Goals Page
 * Contents:
 *  - Active Goals
 *  - Previous Goals
 *
 * -----------------------------------------------
 */
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
        title: const Text('Goals'),
      ),
      body: Stack(
        children : [
          const Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Goals',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),),),
        ]
      ),
    );
  }
}
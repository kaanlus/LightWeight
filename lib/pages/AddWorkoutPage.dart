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
class AddWorkout extends StatefulWidget {

  AddWorkout({
    Key? key,
    required this.pf,
  }) : super(key: key);
  final Profile pf;

  @override
  AddWorkoutState createState() => AddWorkoutState();
}

class AddWorkoutState extends State<AddWorkout> {
  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Template'),
      ),
      body: Stack(
          children : [
            const Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('Add Template',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 100, left: 25),
                child:
                  Text('Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 130 ),
                child:
                SizedBox(
                  width: 365,
                  height: 30,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 175, left: 25),
                child:
                Text('Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 205 ),
                child:
                SizedBox(
                  width: 365,
                  height: 30,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
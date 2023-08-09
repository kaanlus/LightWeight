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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child:
            Padding(
              padding: const EdgeInsets.only(top: 80.0 ),
              child:
              ElevatedButton( child: const Text('\t\t\tCreate New Goal\t\t\t'),
                  onPressed: () {

                  }
              ),
            ),
          ),

          const Align(
            alignment: Alignment.topCenter,
            child:
            Padding(
              padding: EdgeInsets.only(top: 140.0),
              child: Text('Active Goals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 190, left: 15, right: 15, bottom: 360),
            child:
            ListView.builder(
                itemCount: 10/*pro.Goals.length*/,
                itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    const Icon(Icons.check_box_outline_blank,
                      color: Colors.red,
                      size: 50,),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child:
                      SizedBox(
                        width: 200,
                        child:
                        TextButton(
                          child: Text('Goal place holder',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child:
                        ElevatedButton(
                            child: Text('Complete Goal',
                              textAlign: TextAlign.center,),
                        onPressed: () {

                        }),
                      ),
                    ),
                  ],
                );
              }
              ),
            ),

          const Align(
            alignment: Alignment.topCenter,
            child:
            Padding(
              padding: EdgeInsets.only(top: 450.0),
              child: Text('Completed Goals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 500, left: 15, right: 15, bottom: 40),
            child:
            ListView.builder(
                itemCount: 10/*pro.Goals.length*/,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const Icon(Icons.check_box_outlined,
                        color: Colors.red,
                        size: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child:
                        SizedBox(
                          width: 200,
                          child:
                          TextButton(
                            child: Text('Goal place holder',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
        ]
      ),
    );
  }
}
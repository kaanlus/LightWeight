import 'package:flutter/material.dart';
import 'package:lightweight/pages/AddGoalPage.dart';

import '../util/Goal.dart';
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

String ToDate(DateTime dt){
  String formatted;
  formatted = '${dt.month.toString()}/${dt.day.toString()}/${dt.year.toString()}';
  return formatted;
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
                  onPressed: () async {
                    final Goal gl = await Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => AddGoalPage(pf: pro),
                    ),
                    );
                    setState(() {
                      pro.Goals.add(gl);
                    });
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
            padding: const EdgeInsets.only(top: 190, left: 15, right: 15, bottom: 335),
            child:
            ListView.builder(
                itemCount: pro.Goals.length,
                itemBuilder: (BuildContext context, int index) {
                return
                  pro.Goals[index].Is_ative ?
                  Row(
                  children: [
                    const Icon(Icons.check_box_outline_blank,
                      color: Colors.red,
                      size: 50,),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5,bottom: 10),
                      child:
                        SizedBox(
                          width: 200,
                          child:
                            TextButton(
                              child:
                              pro.Goals[index].Is_consistency ?
                                Text('Go to the gym ${pro.Goals[index].Num_times_to_gym} times before ${ToDate(pro.Goals[index].Time_frame)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                                  textAlign: TextAlign.center,):
                                Text('Hit a ${pro.Goals[index].Weight_goal.toInt()} ${pro.Goals[index].Exerise} PR',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                                  textAlign: TextAlign.center,),
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
                            child: const Text('Complete Goal',
                              textAlign: TextAlign.center,),
                        onPressed: () {
                            setState(() {
                              pro.Goals[index].Deactivate();
                            });
                        }),
                      ),
                    ),
                  ],
                ):
                const Row();
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
            padding: const EdgeInsets.only(top: 500, left: 15, right: 15, bottom: 30),
            child:
            ListView.builder(
                itemCount: pro.Goals.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    !pro.Goals[index].Is_ative ?
                    Row(
                    children: [
                      const Icon(Icons.check_box_outlined,
                        color: Colors.red,
                        size: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5,bottom: 10),
                        child:
                        SizedBox(
                          width: 200,
                          child:
                          TextButton(
                            child:
                            pro.Goals[index].Is_consistency ?
                            Text('Go to the gym ${pro.Goals[index].Num_times_to_gym} times before ${ToDate(pro.Goals[index].Time_frame)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.center,):
                            Text('Hit a ${pro.Goals[index].Weight_goal.toInt()} ${pro.Goals[index].Exerise} PR',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.center,),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ],
                  ):
                  Row();
                }
            ),
          ),
        ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lightweight/util/Profile.dart';

/*
 * -----------------------------------------------
 * Goals Page
 * Contents:
 *  1RM calculator
 *
 * -----------------------------------------------
 */
class LogPage extends StatefulWidget {

  const LogPage({
    Key? key,
    required this.pf,
  }) : super(key: key);
  final Profile pf;
  @override
  LogPageState createState() => LogPageState();
}

class LogPageState extends State<LogPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('1RM Calculator'),
      ),
      body:
        Stack(
          children: [

          const Align(
            alignment: Alignment.topCenter,
            child:
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text('Workout Log',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 15, right: 15),
            child:
          Column(
            children:
            List.generate(widget.pf.Workout_log.length, (index) {
              return Row(
                children: [

                  const Icon(Icons.fitness_center_outlined,
                  color: Colors.red,
                  size: 60,),

                  Padding(
                      padding: const EdgeInsets.only(left: 10,),
                      child:
                        SizedBox(
                          width: 200,
                          child:
                          TextButton(
                            child: Text(widget.pf.Workout_log[widget.pf.Workout_log.length - (index + 1)].Get_name(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                            onPressed: () {

                            },
                          ),
                        ),
                  ),
                  SizedBox(
                    width: 110,
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('${widget.pf.Workout_log[widget.pf.Workout_log.length - (index + 1)].Get_workout_date().month}/${widget.pf.Workout_log[widget.pf.Workout_log.length - (index + 1)].Get_workout_date().day}/${widget.pf.Workout_log[widget.pf.Workout_log.length - (index + 1)].Get_workout_date().year}',
                                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                    ),
                  ),
                ],
              );
            }
            ),
          ),
          ),
        ]
      ),
    );
  }
}
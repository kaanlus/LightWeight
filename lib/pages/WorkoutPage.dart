import 'package:flutter/material.dart';
import 'package:lightweight/pages/ExercisePage.dart';
import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Profile.dart';

import '../util/DefaultProfileInit.dart';
import '../util/Workout.dart';

/*
 *
 * Class that calls the stated workout page
 *
 */
class WorkoutPage extends StatefulWidget {


  //index >= 0 --index of workout to load
  //index = -1 --New Workout Template
  //index = -2 --default template 1
  //index = -3 --default template 2
  //index = -4 --default template 3
  /// Home page
  WorkoutPage({
    Key? key,
    required this.index,
    required this.pf,
  }) : super(key: key);
  final int index;
  final Profile pf;

  @override
  WorkoutPageState createState() => WorkoutPageState();
}

/*
 *
 * Class of the workout page
 * Workout page contains:
 *
 *
 */
class WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    List<WorkoutTemplate> DefaultTemplates = PopulateDefault();
    String workoutTitle = '';
    List<ExerciseTemplate> Exercises = [];
    Profile pro = widget.pf;
    if(widget.index >= 0){
      workoutTitle = pro.Saved_templates[widget.index].Workout_name;
      Exercises = pro.Saved_templates[widget.index].Exercise_templates;
    } else if(widget.index == -1){
      workoutTitle = 'New Workout';
    } else if(widget.index == -2){
      workoutTitle = DefaultTemplates[0].Workout_name;
      Exercises = DefaultTemplates[0].Exercise_templates;
    } else if(widget.index == -3){
      workoutTitle = DefaultTemplates[1].Workout_name;
      Exercises = DefaultTemplates[1].Exercise_templates;
    } else if(widget.index == -4){
      workoutTitle = DefaultTemplates[2].Workout_name;
      Exercises = DefaultTemplates[2].Exercise_templates;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutTitle),
      ),
      body: Stack( children : [
            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(workoutTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),),),
            Padding(
              padding: EdgeInsets.only(top: 90.0, bottom: 185.0),
              child:
                GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: (500 / 320),
                  // Generate
                  children:
                    List.generate(Exercises.length, (index) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(Exercises[index].Exercise_name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 30.0 , top: 10),
                                child:
                                  Text('Sets',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                                Padding(padding: EdgeInsets.only(left: 60.0 , top: 10),
                                  child:
                                  Text('Reps',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                                Padding(padding: EdgeInsets.only(left: 60.0 , top: 10),
                                  child:
                                  Text('Weight',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                              ]
                            ),

                            Column(
                            children:
                              List.generate(4, (index) {
                                return
                                  Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 30.0 , top: 15, bottom: 15),
                                        child:
                                          Text('Set ${index + 1}',
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),),
                                        Padding(
                                          padding: EdgeInsets.only(left: 55),
                                          child:
                                          SizedBox(
                                              width: 75,
                                              height: 30,
                                              child: TextFormField(
                                                      textAlign: TextAlign.center,
                                                      decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.all(0),
                                                      border: OutlineInputBorder(),
                                                      hintText: 'Reps',
                                                      ),
                                              ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 38),
                                          child:
                                          SizedBox(
                                            width: 75,
                                            height: 30,
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(0),
                                                border: OutlineInputBorder(),
                                                hintText: 'Weight',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                  );
                              }
                              ),
                            ),
                          ]
                      );
                    }
                  ),
                ),
            ),
      ]),
    );
  }
}
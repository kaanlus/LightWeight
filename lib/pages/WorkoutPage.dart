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
            /*
            GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // Create a grid with 3 columns.
              crossAxisCount: 1,
              // Generate 15 widgets that display their index in the List.
              children: List.generate(Exercises.length, (index) {
                return ;
              }
                ),
              ),

             */
      ]),
    );
  }
}
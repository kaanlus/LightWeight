import 'package:lightweight/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Profile.dart';

import '../util/DefaultProfileInit.dart';
import '../util/Workout.dart';
/*
 * -----------------------------------------------
 * Workout Page
 * Contents:
 *  - List of exercises in the workout and fields for entry data on each set
 *
 *
 * -----------------------------------------------
 */
class WorkoutPage extends StatefulWidget {


  //index >= 0 --index of workout to load
  //index = -1 --New Workout Template
  //index = -2 --default template 1
  //index = -3 --default template 2
  //index = -4 --default template 3
  const WorkoutPage({
    Key? key,
    required this.index,
    required this.pf,
  }) : super(key: key);
  final int index;
  final Profile pf;

  @override
  WorkoutPageState createState() => WorkoutPageState();
}


class WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {

    ///populate default template workouts
    List<WorkoutTemplate> defaultTemplates = PopulateDefault();

    ///Workout title init
    String workoutTitle = '';

    ///List of exercises to render into page
    List<ExerciseTemplate> exercises = [];

    ///WorkoutTemplate being used
    WorkoutTemplate wt;

    ///workout record to be added when finished workout
    WorkoutRecord wr;

    ///Current profile
    Profile pro = widget.pf;



    ///If else tree to select title of workout based on context from last page
    if(widget.index == -2){
      wt = defaultTemplates[0];
      workoutTitle = wt.Workout_name;
      exercises = wt.Exercise_templates;
      wr = wt.Create_record_from();
    } else if(widget.index == -3){
      wt = defaultTemplates[1];
      workoutTitle = wt.Workout_name;
      exercises = wt.Exercise_templates;
      wr = wt.Create_record_from();
    } else if(widget.index == -4){
      wt = defaultTemplates[2];
      workoutTitle = wt.Workout_name;
      exercises = wt.Exercise_templates;
      wr = wt.Create_record_from();
    } else {
      wt = pro.Saved_templates[widget.index];
      workoutTitle = wt.Workout_name;
      exercises = wt.Exercise_templates;
      wr = wt.Create_record_from();
    }

    List<List<TextEditingController>> repControllers ;
    repControllers = List.generate(exercises.length, (i) =>
        List.generate(exercises[i].Set_goal, (j) => TextEditingController()));

    List<List<TextEditingController>> weightControllers ;
    weightControllers = List.generate(exercises.length, (i) =>
        List.generate(exercises[i].Set_goal, (j) => TextEditingController()));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(workoutTitle),
      ),
      body: Stack( children : [

            ///Centered workout title
            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(workoutTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),

            ///Exercise block
            Padding(
              padding: const EdgeInsets.only(top: 90.0, bottom: 185.0),
              child:
              ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                      int reps = exercises[index].Rep_goal;
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(exercises[index].Exercise_name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            ///Row containing labels for each entry point
                            const Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 30.0 , top: 10),
                                child:
                                  Text('Sets',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 60.0 , top: 10),
                                  child:
                                  Text('Reps',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 60.0 , top: 10),
                                  child:
                                  Text('Weight',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ),
                              ]
                            ),

                            ///generates a set of entry fields for each set of a an exercise
                            Column(
                            children:
                              List.generate(exercises[index].Set_goal, (ind) {
                                return
                                  Row(
                                      children: [
                                        ///Numbered set label
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30.0 , top: 15, bottom: 15),
                                          child:
                                            Text('Set ${ind + 1}',
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                            ),
                                        ),

                                        ///Input field for reps done
                                        Padding(
                                          padding: const EdgeInsets.only(left: 55),
                                          child:
                                          SizedBox(
                                              width: 75,
                                              height: 30,
                                              child: TextFormField(
                                                      controller: repControllers[index][ind],
                                                      textAlign: TextAlign.center,
                                                      decoration: InputDecoration(
                                                        contentPadding: const EdgeInsets.all(0),
                                                        border: const OutlineInputBorder(),
                                                        hintText: 'Goal: $reps',
                                                      ),
                                              ),
                                          ),
                                        ),

                                        ///Input field for weight used
                                        Padding(
                                          padding: const EdgeInsets.only(left: 38),
                                          child:
                                          SizedBox(
                                            width: 75,
                                            height: 30,
                                            child: TextFormField(
                                              controller: weightControllers[index][ind],
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.all(0),
                                                border: OutlineInputBorder(),
                                                hintText: 'Weight',
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child:
                                            SizedBox(
                                              width: 75,
                                              height: 30,
                                              child:
                                              ElevatedButton(child: const Text('Save'),
                                              onPressed: () {
                                                if(wr.Exercise_records[index].Rep_for_Set.length == ind){
                                                  int repDone = int.parse(repControllers[index][ind].text);
                                                  double weightUsed = double.parse(weightControllers[index][ind].text);
                                                  wr.Exercise_records[index].Save_active_set(weightUsed, repDone);
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Save Set ${wr.Exercise_records[index].Rep_for_Set.length + 1} First'),
                                                    ),
                                                  );
                                                }
                                              }),
                                            ),
                                        ),
                                      ],
                                  );
                                }
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10) ,
                              child:
                              SizedBox(
                                width: 300,
                                child:
                                ElevatedButton(
                                    child: const Text('Add Set'),
                                    onPressed: () {
                                      setState(() {
                                        exercises[index].Add_one_set();
                                      });
                                    }
                                ),
                              ),
                            ),
                          ]
                      );
                    }
                  ),
                ),


        Align(
          alignment: Alignment.bottomCenter,
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 105) ,
            child:
            SizedBox(
              width: 300,
              child:
              ElevatedButton(
                  child: const Text('Finish Workout'),
                  onPressed: ()  {
                    double vol = 0;
                    for(int i = 0; i < wr.Exercise_records.length; i++){
                      for(int j = 0; j < wr.Exercise_records[i].Sets_done; j++){
                        vol = vol + (wr.Exercise_records[i].Weight_for_set[j] * wr.Exercise_records[i].Rep_for_Set[j]);
                      }
                    }
                    pro.Volume_history.add(VolumeHist(vol.toInt(), wr.Get_workout_date()));
                    pro.Workout_log.add(wr);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(title: 'Light Weight Home', pf: pro)),
                          (Route<dynamic> route) => false,
                    );
                  }
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 55) ,
            child:
            SizedBox(
              width: 300,
              child:
              ElevatedButton(
                  child: const Text('Delete Workout'),
                  onPressed: ()  {
                    pro.Saved_templates.removeAt(widget.index);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(title: 'Light Weight Home', pf: pro)),
                          (Route<dynamic> route) => false,
                    );
                  }
              ),
            ),
          ),
        ),


        Align(
          alignment: Alignment.bottomCenter,
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 5) ,
            child:
            SizedBox(
              width: 300,
              child:
              ElevatedButton(
                  child: const Text('Cancel Workout'),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
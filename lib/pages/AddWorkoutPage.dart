import 'package:flutter/material.dart';
import 'package:lightweight/pages/AddExercisePage.dart';
import 'package:lightweight/pages/HomePage.dart';
import 'package:lightweight/util/Workout.dart';
import '../util/Exercise.dart';
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

  List<ExerciseTemplate> toAdd = [];

  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    TextEditingController nameController = TextEditingController();


    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    controller: nameController,
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
                padding: EdgeInsets.only(top: 180, left: 25),
                child:
                Text('Exercise',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 180, left: 225),
                child:
                Text('Reps',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 180, left: 325),
                child:
                Text('Sets',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

           Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 200, left: 25, right: 25, bottom: 100),
                child:
                ListView.builder(
                    itemCount: toAdd.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child:
                            SizedBox(
                              width: 100,
                              child:
                                Text(toAdd[index].Exercise_name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child:
                          Padding(
                            padding: const EdgeInsets.only(left: 105,top:20),
                            child:
                            SizedBox(
                              width: 30,
                              child:
                                Text(toAdd[index].Rep_goal.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ),
                          ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 70, top:20),
                            child:
                            Text(toAdd[index].Set_goal.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                )
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
                      child: const Text('Add Exercise'),
                      onPressed: () async {
                        final indx = await Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => AddExercise(pf: pro, ta: toAdd),
                        ),
                        );
                        setState(() {
                          toAdd.add(pro.Saved_exercises[indx]);
                        });
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
                        child: const Text('Finish Template'),
                        onPressed: () {
                            WorkoutTemplate tmp = WorkoutTemplate(nameController.text);
                            for(int i = 0; i < toAdd.length; i++){
                              tmp.Add_exercise(toAdd[i]);
                            }
                            pro.Add_workout_template(tmp);
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
          ]
      ),
    );
  }
}

/*
   Align(
    alignment: Alignment.topCenter,
    child:
      Padding(
        padding: EdgeInsets.only(top: 0) ,
        child: Text(''),
      ),
    ),
 */
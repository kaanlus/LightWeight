import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    List<ExerciseTemplate> toAdd = [];
    TextEditingController nameController = TextEditingController();
    /// ADD TEST REMOVE IN PRACTICE
    toAdd.add(ExerciseTemplate('Exercise 1', 3, 10 , 'sample1', 'sample1'));
    toAdd.add(ExerciseTemplate('Exercise 2', 4, 10 , 'sample2', 'sample2'));
    /// ___________________________
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
                padding: const EdgeInsets.only(top: 200, left: 25, bottom: 100),
                child:
                Column(
                  children:
                    List.generate(toAdd.length, (index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child:
                            Text(toAdd[index].Exercise_name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 140,top:20),
                            child:
                            Text(toAdd[index].Rep_goal.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 85, top:20),
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
                      onPressed: () {

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
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context) => HomePage(title: 'Light Weight Home', pf: pro),
                            ),
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
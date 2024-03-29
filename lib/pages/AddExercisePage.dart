import 'package:flutter/material.dart';

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
class AddExercise extends StatefulWidget {

  AddExercise({
    Key? key,
    required this.pf,
    required this.ta
  }) : super(key: key);
  final Profile pf;
  final List<ExerciseTemplate> ta;

  @override
  AddExerciseState createState() => AddExerciseState();
}

class AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    TextEditingController nameController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController muscleController = TextEditingController();
    TextEditingController repController = TextEditingController();
    TextEditingController setController = TextEditingController();
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
                    controller: descController,
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

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 250, left: 25),
                child:
                Text('Muscle Group',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 280 ),
                child:
                SizedBox(
                  width: 365,
                  height: 30,
                  child: TextFormField(
                    controller: muscleController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(),
                      hintText: 'Muscle Group',
                    ),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 325, left: 25),
                child:
                Text('Reps',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 355, left: 25 ),
                child:
                SizedBox(
                  width: 160,
                  height: 30,
                  child: TextFormField(
                    controller: repController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(),
                      hintText: 'Reps',
                    ),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topRight,
              child:
              Padding(
                padding: EdgeInsets.only(top: 325, right: 150),
                child:
                Text('Sets',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 355, right: 25 ),
                child:
                SizedBox(
                  width: 160,
                  height: 30,
                  child: TextFormField(
                    controller: setController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(),
                      hintText: 'Sets',
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
                Padding(
                  padding: EdgeInsets.only(top: 410) ,
                  child:
                    SizedBox(
                      width: 300,
                      height: 50,
                      child:
                        ElevatedButton(
                          child: Text('Add Exercise'),
                          onPressed: () {
                            ExerciseTemplate newT = ExerciseTemplate(nameController.text, int.parse(setController.text), int.parse(repController.text), descController.text, muscleController.text);
                            pro.Saved_exercises.add(newT);
                            Navigator.pop(context, pro.Saved_exercises.length-1);
                            },
                        )
                    )
                ),
            ),

            const Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 490),
                child:
                Text('Saved templates',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
                Padding(
                  padding: const EdgeInsets.only(top: 530, bottom: 10),
                  child:
                    SizedBox(
                      width: 365,
                      height: 300,
                      child:
                        GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisCount: 1,
                          childAspectRatio: (500/100),
                          children: List.generate(pro.Saved_exercises.length, (index) {
                            return
                            Row(
                              children : [
                                SizedBox(
                                  width:250,
                                  height: 200,
                                  child:
                                  ElevatedButton(
                                  child: Text(pro.Saved_exercises[index].Get_name()),
                                  onPressed: () {
                                    Navigator.pop(context, index);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:100,
                                  height: 200,
                                  child:
                                  ElevatedButton(
                                    child: Text('Delete Exercise'),
                                    onPressed: () {
                                      setState(() {
                                        pro.Saved_exercises.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ]
                            );
                          }),
                        ),
                    ),
            ),
            )
          ]
      ),
    );
  }
}
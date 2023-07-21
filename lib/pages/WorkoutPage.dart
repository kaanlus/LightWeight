import 'package:flutter/material.dart';
import 'package:lightweight/pages/ExercisePage.dart';

/*
 *
 * Class that calls the stated workout page
 *
 */
class WorkoutPage extends StatefulWidget {
  final int number;

  /// Home page
  WorkoutPage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  WorkoutPageState createState() => WorkoutPageState();
}

/*
 *
 * Class of the workout page
 * Workout page contains:
 *    Timer of 30 seconds
 *
 */
class WorkoutPageState extends State<WorkoutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.number >= 0?
        Text(
          //button context workout number
            'Workout ${widget.number}'):
        Text('New Workout'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns.
        crossAxisCount: 3,
        // Generate 15 widgets that display their index in the List.
        children: List.generate(9, (index) {
          return Center(
            child: ElevatedButton(
              child: Text('Exercise ${index + 1}'),
              //on button press take user to the workout page using the navigator
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ExercisePage(number: index+1),
                ),
                );},
            ),
          );
        }),
      ),
    );
  }
}
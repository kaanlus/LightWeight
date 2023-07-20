import 'package:lightweight/Exercise.dart';

class Workout{
  String Workout_name;

  DateTime Workout_date = DateTime.now();

  List<Exercise> Workout_exercises = [];

  Workout(this.Workout_name);

  Add_exercise(Exercise ex){ Workout_exercises.add(ex); }

  Exercise Get_exercise(int index){ return this.Workout_exercises[index]; }

  Get_name() { return this.Workout_name; }

}
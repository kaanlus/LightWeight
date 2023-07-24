import 'package:lightweight/util/Exercise.dart';

/*
 * -----------------------------------------------
 * Workout Template Class
 * Contents:
 *  - Name
 *  - Exercises in the workout
 *
 * -----------------------------------------------
 */
class WorkoutTemplate {

  ///Name of the workout
  String Workout_name;

  ///List of the exercises in the workout
  List<ExerciseTemplate> Exercise_templates = [];

  ///Constructor
  WorkoutTemplate(this.Workout_name);

  ///Adds an exercise to the template
  Add_exercise(ExerciseTemplate){

    Exercise_templates.add(ExerciseTemplate);

  }

  ///Returns name of the workout
  Get_name(){ return this.Workout_name; }

  ///Returns list of the template exercises in the workout
  List<ExerciseTemplate> Get_templates() { return this.Exercise_templates; }

  ///Creates a workout record from the current template
  WorkoutRecord Create_record_from(){
    return WorkoutRecord(this.Workout_name);
  }
}

/*
 * -----------------------------------------------
 * Workout Template Class
 * Contents:
 *  Super:
 *  - Name
 *  - Exercises in the workout
 *
 *  Record:
 *  - Exercise records
 *  - Date of the workout
 * -----------------------------------------------
 */
class WorkoutRecord extends WorkoutTemplate {

  ///Date of the workout set to time of creation of record
  DateTime Workout_date = DateTime.now();

  ///List of the exercise records
  List<ExerciseRecord> Exercise_records = [];

  ///Constructor of workout record
  WorkoutRecord(super.Workout_name){
    for( int i = 0; i < super.Exercise_templates.length; i++){
      Exercise_records.add(super.Exercise_templates[i].Create_record_from());
    }
  }

  ///Adds a workout to the template
  Add_exercise_record(ExerciseTemplate ex){
    Exercise_records.add(ex.Create_record_from());
  }

  ///Returns a list of the exercise records
  List<ExerciseRecord> Get_exercise_records(){
    return Exercise_records;
  }

  ///Returns date of the workout
  DateTime Get_workout_date(){ return Workout_date; }
}
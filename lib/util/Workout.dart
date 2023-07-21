import 'package:lightweight/util/Exercise.dart';

class WorkoutTemplate {
  String Workout_name;

  List<ExerciseTemplate> Exercise_templates = [];

  WorkoutTemplate(this.Workout_name);

  Add_exercise(ExerciseTemplate){

    Exercise_templates.add(ExerciseTemplate);

  }

  Get_name(){ return this.Workout_name; }

  List<ExerciseTemplate> Get_templates() { return this.Exercise_templates; }

  WorkoutRecord Create_record_from(){
    return WorkoutRecord(this.Workout_name);
  }
}

class WorkoutRecord extends WorkoutTemplate {
  DateTime Workout_date = DateTime.now();

  List<ExerciseRecord> Exercise_records = [];

  WorkoutRecord(super.Workout_name){
    for( int i = 0; i < super.Exercise_templates.length; i++){
      Exercise_records.add(super.Exercise_templates[i].Create_record_from());
    }
  }

  Add_exercise_record(ExerciseTemplate ex){
    Exercise_records.add(ex.Create_record_from());
  }

  List<ExerciseRecord> Get_exercise_records(){
    return Exercise_records;
  }

  DateTime Get_workout_date(){ return Workout_date; }
}
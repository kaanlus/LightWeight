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

  ///Removes exercise template
  Remove_exercise(int index){
    Exercise_templates.removeAt(index);
  }

  ///Returns name of the workout
  Get_name(){ return this.Workout_name; }

  ///Returns list of the template exercises in the workout
  List<ExerciseTemplate> Get_templates() { return this.Exercise_templates; }

  ///Creates a workout record from the current template
  WorkoutRecord Create_record_from(){
    List<ExerciseRecord> ER = [];
    for( int i = 0; i < Exercise_templates.length; i++){
      ER.add(Exercise_templates[i].Create_record_from());
    }
    return WorkoutRecord(this.Workout_name, ER);
  }


  //IO
  Map<String, dynamic> toJson() {
    return {
      'workoutName': Workout_name,
      'exerciseTemplates': Exercise_templates.map((et) => et.toJson()).toList(),
    };
  }

  factory WorkoutTemplate.fromJson(Map<String, dynamic> jsonData) {
    WorkoutTemplate wt = WorkoutTemplate(jsonData['workoutName']);

    if (jsonData.containsKey('exerciseTemplates')) {
      wt.Exercise_templates = (jsonData['exerciseTemplates'] as List)
          .map((etJson) => ExerciseTemplate.fromJson(etJson))
          .toList();
    }

    return wt;
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
  List<ExerciseRecord> Exercise_records;

  ///Constructor of workout record
  WorkoutRecord(super.Workout_name, this.Exercise_records);

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

  //IO
  @override
  Map<String, dynamic> toJson() {
    // Get the JSON format from WorkoutTemplate
    Map<String, dynamic> json = super.toJson();

    // Add WorkoutRecord specific details
    json['workoutDate'] = Workout_date.toIso8601String();
    json['exerciseRecords'] = Exercise_records.map((er) => er.toJson()).toList();

    return json;
  }

  factory WorkoutRecord.fromJson(Map<String, dynamic> jsonData) {
    // Initialize using super
    WorkoutRecord wr = WorkoutRecord(jsonData['workoutName'], []);

    if (jsonData.containsKey('exerciseRecords')) {
      wr.Exercise_records = (jsonData['exerciseRecords'] as List)
          .map((erJson) => ExerciseRecord.fromJson(erJson))
          .toList();
    }

    if (jsonData.containsKey('workoutDate')) {
      wr.Workout_date = DateTime.parse(jsonData['workoutDate']);
    }

    return wr;
  }
}
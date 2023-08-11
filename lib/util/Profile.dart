import 'package:flutter/material.dart';
import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Goal.dart';
import 'package:lightweight/util/Workout.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/*
 * -----------------------------------------------
 * Profile Class
 * Contents:
 *  - Name
 *  - Volume history
 *  - saved templates
 *  - Workout log
 *  - goals
 *
 * -----------------------------------------------
 */
class Profile {

  ///users name
  String  Users_name;

  ///Volume history
  List<VolumeHist> Volume_history = [];

  ///Progress on goals
  List<int> Goal_progress = [];

  ///Saved templates
  List<WorkoutTemplate> Saved_templates = [];

  ///Workout log
  List<WorkoutRecord> Workout_log = [];

  ///List of exercises
  List<ExerciseTemplate> Saved_exercises = [];

  ///Goals
  List<Goal> Goals = [];

  ///Constructor
  Profile(this.Users_name);

  // A factory constructor to create a Profile from JSON
  factory Profile.fromJson(Map<String, dynamic> jsonData) {
    //Extract name from JSON
    String extractedName = jsonData['name'];


    //Construct and return the Profile object using extracted data
    Profile profile = Profile(extractedName);

    if (jsonData.containsKey('volumeHistories')) {
      profile.Volume_history = (jsonData['volumeHistories'] as List)
          .map((vhJson) => VolumeHist.fromJson(vhJson))
          .toList();
    }

    if (jsonData.containsKey('goals')) {
      profile.Goals = (jsonData['goals'] as List)
          .map((gJson) => Goal.fromJson(gJson))
          .toList();
    }

    if (jsonData.containsKey('goalProgress')) {
      profile.Goal_progress = List<int>.from(jsonData['goalProgress']);
    }

    if (jsonData.containsKey('savedTemplates')) {
      profile.Saved_templates = (jsonData['savedTemplates'] as List)
          .map((wtJson) => WorkoutTemplate.fromJson(wtJson))
          .toList();
    }

    if (jsonData.containsKey('workoutLog')) {
      profile.Workout_log = (jsonData['workoutLog'] as List)
          .map((wrJson) => WorkoutRecord.fromJson(wrJson))
          .toList();
    }

    if (jsonData.containsKey('savedExercises')) {
      profile.Saved_exercises = (jsonData['savedExercises'] as List)
          .map((etJson) => ExerciseTemplate.fromJson(etJson))
          .toList();
    }

    return profile;
  }

  //Saves relevent profile information
  Map<String, dynamic> toJson() {
    return {
      'name': Get_name(),
      'volumeHistories': Volume_history.map((vh) => vh.toJson()).toList(),
      'goals': Goals.map((g) => g.toJson()).toList(),
      'goalProgress': Goal_progress,
      'savedTemplates': Saved_templates.map((wt) => wt.toJson()).toList(),
      'workoutLog': Workout_log.map((wr) => wr.toJson()).toList(),
      'savedExercises': Saved_exercises.map((et) => et.toJson()).toList(),
    };
  }

  ///Returns user name
  Get_name(){ return this.Users_name; }

  ///Add a new workout template
  Add_workout_template(WorkoutTemplate wt){ Saved_templates.add(wt); }

  ///Add a new workout record
  Add_workout_record(WorkoutRecord wr){ Workout_log.add(wr); }

  Add_exercise_template(ExerciseTemplate et){ Saved_exercises.add(et); }

  ///Add a new goal
  Add_goal(Goal g){ Goals.add(g); }

  ///Add to volume history
  Add_volume(DateTime dt, int vol) { Volume_history.add(VolumeHist(vol, dt)); }

  ///Return the list of goals for a user
  List<Goal> Get_goals(){ return Goals; }

  ///Returns progress for goals
  List<int> Get_progress(){ return Goal_progress; }

  ///Returns list of saved templates
  Get_workout_template(){ return Saved_templates; }

  ///Returns list of Exercise templates
  Get_exercise_template(){ return Saved_templates; }

  ///Returns list of previous saved workouts
  Get_workout_history(){ return Workout_log; }

}

class VolumeHist{

  ///int value of volume
  final int volume;

  final DateTime MonthDay;
  ///color of line graph
  final charts.Color Barcolor = charts.ColorUtil.fromDartColor(Colors.red);

  VolumeHist( this.volume, this.MonthDay);

  // Convert VolumeHist to JSON
  Map<String, dynamic> toJson() {
    return {
      'volume': volume,
      'monthDay': MonthDay.toIso8601String(),
    };
  }

  // A factory constructor to create VolumeHist from JSON
  factory VolumeHist.fromJson(Map<String, dynamic> jsonData) {
    return VolumeHist(
      jsonData['volume'],
      DateTime.parse(jsonData['monthDay']),
    );
  }
}
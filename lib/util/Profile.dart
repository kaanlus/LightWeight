import 'package:flutter/material.dart';
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

  ///Goals
  List<Goal> Goals = [];

  ///Constructor
  Profile(this.Users_name);

  ///Returns user name
  Get_name(){ return this.Users_name; }

  ///Add a new workout template
  Add_workout_template(WorkoutTemplate wt){ Saved_templates.add(wt); }

  ///Add a new workout record
  Add_workout_record(WorkoutRecord wr){ Workout_log.add(wr); }

  ///Add a new goal
  Add_goal(Goal g){ Goals.add(g); }

  ///Add to volume history
  Add_volume(int dt, int vol) { Volume_history.add(VolumeHist(vol, dt)); }

  ///Return the list of goals for a user
  List<Goal> Get_goals(){ return Goals; }

  ///Returns progress for goals
  List<int> Get_progress(){ return Goal_progress; }

  ///Returns list of saved templates
  Get_workout_template(){ return Saved_templates; }

  ///Returns list of previous saved workouts
  Get_workout_history(){ return Workout_log; }


}

class VolumeHist{

  ///int value of volume
  final int volume;
  /// 0011 format for date 00 = month 11 = day
  final int MonthDay;
  ///color of line graph
  final charts.Color Barcolor = charts.ColorUtil.fromDartColor(Colors.red);

  VolumeHist( @required this.volume, @required this.MonthDay);
}
import 'package:lightweight/util/Goal.dart';
import 'package:lightweight/util/Workout.dart';

class Profile {
  String  Users_name;

  Map<DateTime, double> Volume_history = Map();

  List<int> Goal_progress = [];

  List<WorkoutTemplate> Saved_templates = [];

  List<WorkoutRecord> Workout_log = [];

  List<Goal> Goals = [];

  Profile(this.Users_name);


  Get_name(){ return this.Users_name; }

  Add_workout_template(WorkoutTemplate wt){ Saved_templates.add(wt); }

  Add_workout_record(WorkoutRecord wr){ Workout_log.add(wr); }

  Add_goal(Goal g){ Goals.add(g); }

  Add_volume_on_date(DateTime dt, double vol) { Volume_history[dt] = vol; }

  List<Goal> Get_goals(){ return Goals; }

  List<int> Get_progress(){ return Goal_progress; }

  Get_workout_template(){ return Saved_templates; }

  Get_workout_history(){ return Workout_log; }

  Get_volume(DateTime dt){ return Volume_history[dt]; }

}

/*
class VolumePair {
  DateTime date;
  double volume;
  VolumePair(this.date, this.volume);
  Get_first(){ return this.date; }
  Get_second(){ return this.volume; }
}
 */
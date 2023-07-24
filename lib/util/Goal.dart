/*
 * -----------------------------------------------
 * Goal Class
 * Contents:
 *  - Type
 *  - Goal requirements
 *  - If goal is active or not
 *
 * -----------------------------------------------
 */
class Goal{

  ///Type of goal
  bool  Is_consistency;

  ///# time to the gym goal
  int Num_times_to_gym;

  ///Time constraint of the goal
  DateTime Time_frame;

  ///Name of the Exercise
  String Exerise;

  ///weight goal
  double Weight_goal;

  ///Is goal currently active
  bool Is_ative = true;

  ///Constructor for goal object
  Goal(this.Is_consistency , this.Num_times_to_gym, this.Time_frame, this.Exerise, this.Weight_goal);

  ///Deactivate goal
  Deactivate(){ this.Is_ative = false; }

  ///Returns type of goal
  Get_goal_type(){ if(Is_consistency) return 'Consistency'; else return 'Weight'; }

  ///Returns # of times to the gym goal
  Get_times_goal() { return this.Num_times_to_gym; }

  ///Returns time constraint of a goal
  Get_time_frame(){ return this.Time_frame; }

  ///Returns exercise name
  Get_exercise(){ return this.Exerise; }

  ///Returns weight goal
  Get_weight(){ return this.Weight_goal; }

  ///Returns if the goal is active or not
  Get_active(){ if(Is_ative) return 'Active'; else return 'Inactive'; }

}
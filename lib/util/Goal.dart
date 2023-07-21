class Goal{
  bool  Is_consistency;

  int Num_times_to_gym;

  DateTime Time_frame;

  String Exerise;

  double Weight_goal;

  bool Is_ative = true;

  Goal(this.Is_consistency , this.Num_times_to_gym, this.Time_frame, this.Exerise, this.Weight_goal);


  Deactivate(){ this.Is_ative = false; }

  Get_goal_type(){ if(Is_consistency) return 'Consistency'; else return 'Weight'; }

  Get_times_goal() { return this.Num_times_to_gym; }

  Get_time_frame(){ return this.Time_frame; }

  Get_exercise(){ return this.Exerise; }

  Get_weight(){ return this.Weight_goal; }

  Get_active(){ if(Is_ative) return 'Active'; else return 'Inactive'; }

}
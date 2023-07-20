class Exercise{
   String Exercise_name;
   int Set_goal;
   int Sets_done = 0;

   List<double> Weight_for_set = [];

   List<int> Rep_for_Set = [];

   String Exercise_description;

   String Target_muscle;

   Exercise(this.Exercise_name, this.Set_goal, this.Exercise_description, this.Target_muscle);

   String Get_name(){ return this.Exercise_name;}

   int Get_sets(){ return this.Sets_done; }

   int Get_rep_of_set(int index){ return this.Rep_for_Set[index]; }

   double Get_weight_of_set(int index){ return this.Weight_for_set[index]; }

   Add_one_set(){
     this.Set_goal++;
   }

   Save_active_set(double weight, int reps){
     this.Sets_done++;
     Weight_for_set.insert(Sets_done, weight);
     Rep_for_Set.insert(Sets_done, reps);
   }

}
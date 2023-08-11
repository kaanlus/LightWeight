/*
 * -----------------------------------------------
 * Exercise Template Class
 * Contents:
 *  - Name
 *  - # of sets to do
 *  - Description
 *  - Target muscle
 *
 * -----------------------------------------------
 */
class ExerciseTemplate{

    ///Name of the exercise
   String Exercise_name;

   ///# for goal of sets to do in an exercise
   int Set_goal;

   ///# for goal of reps to do per set
   int Rep_goal;

   ///description of the exercise
   String Exercise_description;

   ///Target muscle for the exercise
   String Target_muscle;

   ///Constructor for the exercise template object
   ExerciseTemplate(this.Exercise_name, this.Set_goal, this.Rep_goal , this.Exercise_description, this.Target_muscle);

   ///Returns name of the exercise
   String Get_name(){ return this.Exercise_name;}

   ///Returns # of sets to do
   int Get_sets(){ return this.Set_goal; }

   ///Returns # of reps to do
   int Get_reps(){ return this.Rep_goal; }

   ///Increase number of sets by one, limited to 4
   Add_one_set(){
      this.Set_goal++;
   }

   ///Creates a record of the current exercise from the current template
   ExerciseRecord Create_record_from(){
     return ExerciseRecord(this.Exercise_name, this.Set_goal, this.Set_goal ,this.Exercise_description, this.Target_muscle);
   }

   // Convert ExerciseTemplate to JSON
   Map<String, dynamic> toJson() {
     return {
       'exerciseName': Exercise_name,
       'setGoal': Set_goal,
       'repGoal': Rep_goal,
       'description': Exercise_description,
       'targetMuscle': Target_muscle
     };
   }

   // Create ExerciseTemplate from JSON
   factory ExerciseTemplate.fromJson(Map<String, dynamic> jsonData) {
     return ExerciseTemplate(
       jsonData['exerciseName'],
       jsonData['setGoal'],
       jsonData['repGoal'],
       jsonData['description'],
       jsonData['targetMuscle'],
     );
   }

}

/*
 * -----------------------------------------------
 * Exercise Template Class
 * Contents:
 *  Super:
 *  - Name
 *  - # of sets to do
 *  - Description
 *  - Target muscle
 *
 *  Record:
 *  - # sets done
 *  - Weight done for each set
 *  - Reps for each set
 * -----------------------------------------------
 */

class ExerciseRecord extends ExerciseTemplate {

  ///# of sets done
  int Sets_done = 0;

  ///List of weight used for each set
  List<double> Weight_for_set = [];

  ///List of reps for each set
  List<int> Rep_for_Set = [];

  ///Constructor of record using contents for template object
  ExerciseRecord(super.Exercise_name, super.Set_goal, super.Rep_goal ,super.Exercise_description, super.Target_muscle);

  ///Returns # of sets already done
  int Get_sets_done(){ return this.Sets_done; }

  ///Returns # of reps done for a given set
  int Get_rep_of_set(int index){ return this.Rep_for_Set[index]; }

  ///Returns weight used for a given set
  double Get_weight_of_set(int index){ return this.Weight_for_set[index]; }

  ///Increase the number of sets done by one
  Add_one_set(){
      this.Set_goal++;
  }

  ///Saves active set reps and weight to the record
  Save_active_set(double weight, int reps){
    Sets_done++;
    Weight_for_set.add(weight);
    Rep_for_Set.add(reps);
  }

  // Convert ExerciseRecord to JSON (Override it to expand upon the parent's method)
  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'setsDone': Sets_done,
      'weightForSet': Weight_for_set,
      'repForSet': Rep_for_Set,
    });
    return json;
  }

  // Create ExerciseRecord from JSON
  factory ExerciseRecord.fromJson(Map<String, dynamic> jsonData) {
    var record = ExerciseRecord(
      jsonData['exerciseName'],
      jsonData['setGoal'],
      jsonData['repGoal'],
      jsonData['description'],
      jsonData['targetMuscle'],
    );

    if (jsonData.containsKey('setsDone')) {
      record.Sets_done = jsonData['setsDone'];
    }

    if (jsonData.containsKey('weightForSet')) {
      record.Weight_for_set = List<double>.from(jsonData['weightForSet']);
    }

    if (jsonData.containsKey('repForSet')) {
      record.Rep_for_Set = List<int>.from(jsonData['repForSet']);
    }

    return record;
  }
}

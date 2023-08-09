import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Goal.dart';
import 'package:lightweight/util/Workout.dart';
import 'package:lightweight/util/Profile.dart';

///Returns a default populated profile
Profile CreateDefault(){
  Profile defaultUserProfile = Profile('Default User');
  defaultUserProfile.Volume_history = PopulateVolume();
  defaultUserProfile.Saved_exercises = PopulateExercises();
  defaultUserProfile.Workout_log = PopulateLog();
  defaultUserProfile.Goals = PopulateGoals();
  return defaultUserProfile;
}

List<ExerciseTemplate> PopulateExercises(){
  List<ExerciseTemplate> etl = [];

  etl.add(ExerciseTemplate('Bench Press', 3, 10 ,'Barbell Bench press', 'Pectoralis Major'));
  etl.add(ExerciseTemplate('Chest Flys', 3, 10 , 'Dumbbell flys', 'Pectoralis Major'));
  etl.add(ExerciseTemplate('Triceps Extensions', 4, 10 , 'Dumbbell overhead triceps Extensions', 'Triceps Brachii'));
  etl.add(ExerciseTemplate('Leg Extensions', 4, 10 , 'Cable Machine Leg extensions', 'Quadriceps Femoris'));

  return etl;
}

List<Goal> PopulateGoals() {
  List<Goal> lgs = [];
  lgs.add(Goal(true, 2, DateTime.utc(2023,08,29), '', 0));
  lgs.add(Goal(true, 4, DateTime.utc(2023,05,01), '', 0));
  lgs[1].Deactivate();
  lgs.add(Goal(false, 2, DateTime.utc(0000), 'Bench Press', 200));
  lgs.add(Goal(false, 2, DateTime.utc(000), 'Leg Extensions', 160));
  return lgs;
}

List<WorkoutRecord> PopulateLog(){
  List<WorkoutRecord> lwr = [];
  WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
  WorkoutRecord CaTR = CaT.Create_record_from();
  ExerciseTemplate et1 = ExerciseTemplate('Bench Press', 3, 10 ,'Barbell Bench press', 'Pectoralis Major');
  ExerciseRecord er1 = et1.Create_record_from();
  er1.Rep_for_Set = [10, 10, 10];
  er1.Weight_for_set = [190, 190, 190];
  er1.Sets_done = 3;
  ExerciseTemplate et2 = ExerciseTemplate('Chest Flys', 3, 10 , 'Dumbbell flys', 'Pectoralis Major');
  ExerciseRecord er2 = et2.Create_record_from();
  er2.Rep_for_Set = [10, 10, 10];
  er2.Weight_for_set = [50, 50, 50];
  er2.Sets_done = 3;
  ExerciseTemplate et3 = ExerciseTemplate('Triceps Extensions', 4, 10 , 'Dumbbell overhead triceps Extensions', 'Triceps Brachii');
  ExerciseRecord er3 = et3.Create_record_from();
  er3.Rep_for_Set = [10, 10, 10];
  er3.Weight_for_set = [60, 60, 60];
  er3.Sets_done = 3;
  CaTR.Exercise_records.add(er1);
  CaTR.Exercise_records.add(er2);
  CaTR.Exercise_records.add(er3);
  CaTR.Workout_date = DateTime.now();
  lwr.add(CaTR);
  return lwr;
}
///Populating function
List<WorkoutTemplate> PopulateDefault() {

  ///Workout template list
  List<WorkoutTemplate> dtl = [];

  ///Default templates
  final WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
  final WorkoutTemplate Leg = WorkoutTemplate('Legs');
  final WorkoutTemplate BaB = WorkoutTemplate('Back and Biceps');

  ///Chest and triceps default exercises
  final ExerciseTemplate BP = ExerciseTemplate('Bench Press', 3, 10 ,'Barbell Bench press', 'Pectoralis Major');
  final ExerciseTemplate CF = ExerciseTemplate('Chest Flys', 3, 10 , 'Dumbbell flys', 'Pectoralis Major');
  final ExerciseTemplate TE = ExerciseTemplate('Triceps Extensions', 4, 10 , 'Dumbbell overhead triceps Extensions', 'Triceps Brachii');

  ///Add to workout
  CaT.Exercise_templates.add(BP);
  CaT.Exercise_templates.add(CF);
  CaT.Exercise_templates.add(TE);

  ///Legs default exercises
  final ExerciseTemplate LE = ExerciseTemplate('Leg Extensions', 4, 10 , 'Cable Machine Leg extensions', 'Quadriceps Femoris');
  final ExerciseTemplate LC = ExerciseTemplate('Leg Curls', 4, 10 , 'Cable Machine Leg curls', 'Biceps Femoris');
  final ExerciseTemplate BS = ExerciseTemplate('Back Squats', 3, 10 , 'Barbell Back Squats', 'Quadriceps Femoris');

  ///Add to workout
  Leg.Exercise_templates.add(LE);
  Leg.Exercise_templates.add(LC);
  Leg.Exercise_templates.add(BS);

  ///Back and biceps default exercises
  final ExerciseTemplate R = ExerciseTemplate('Rows', 3, 10 , 'Chest Supported Dumbbell rows', 'Trapezius');
  final ExerciseTemplate BF = ExerciseTemplate('Back Flys', 3, 10 , 'Reverse Dumbbell flys', 'Deltoid');
  final ExerciseTemplate BC = ExerciseTemplate('Bicep Curls', 4, 10 , 'Dumbbell overhead triceps Extensions', 'Bicep Brachii');

  ///Add to workout
  BaB.Exercise_templates.add(R);
  BaB.Exercise_templates.add(BF);
  BaB.Exercise_templates.add(BC);

  ///Add workout templates to return list
  dtl.add(CaT);
  dtl.add(Leg);
  dtl.add(BaB);
  
  ///return the list of default templates
  return dtl;
}

///populates the sample volume history data
List<VolumeHist> PopulateVolume(){
  List<VolumeHist> vhl = [];
  vhl.add(VolumeHist(10800, DateTime.utc(2023,1,1)));
  vhl.add(VolumeHist(11600, DateTime.utc(2023,4,1)));
  vhl.add(VolumeHist(12070, DateTime.utc(2023,6,6)));
  vhl.add(VolumeHist(9400, DateTime.utc(2023,10,4)));
  return vhl;
}


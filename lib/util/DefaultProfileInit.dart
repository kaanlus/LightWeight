import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Workout.dart';
import 'package:lightweight/util/Profile.dart';

///Returns a default populated profile
Profile CreateDefault(){
  Profile defaultUserProfile = Profile('Default User');
  defaultUserProfile.Saved_templates = PopulateTemplates();
  defaultUserProfile.Volume_history = PopulateVolume();
  return defaultUserProfile;
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
  final ExerciseTemplate BP = ExerciseTemplate('Bench Press', 3, 'Barbell Bench press', 'Pectoralis Major');
  final ExerciseTemplate CF = ExerciseTemplate('Chest Flys', 3, 'Dumbbell flys', 'Pectoralis Major');
  final ExerciseTemplate TE = ExerciseTemplate('Triceps Extensions', 4, 'Dumbbell overhead triceps Extensions', 'Triceps Brachii');

  ///Add to workout
  CaT.Exercise_templates.add(BP);
  CaT.Exercise_templates.add(CF);
  CaT.Exercise_templates.add(TE);

  ///Legs default exercises
  final ExerciseTemplate LE = ExerciseTemplate('Leg Extensions', 4, 'Cable Machine Leg extensions', 'Quadriceps Femoris');
  final ExerciseTemplate LC = ExerciseTemplate('Leg Curls', 4, 'Cable Machine Leg curls', 'Biceps Femoris');
  final ExerciseTemplate BS = ExerciseTemplate('Back Squats', 3, 'Barbell Back Squats', 'Quadriceps Femoris');

  ///Add to workout
  Leg.Exercise_templates.add(LE);
  Leg.Exercise_templates.add(LC);
  Leg.Exercise_templates.add(BS);

  ///Back and biceps default exercises
  final ExerciseTemplate R = ExerciseTemplate('Rows', 3, 'Chest Supported Dumbbell rows', 'Trapezius');
  final ExerciseTemplate BF = ExerciseTemplate('Back Flys', 3, 'Reverse Dumbbell flys', 'Deltoid');
  final ExerciseTemplate BC = ExerciseTemplate('Bicep Curls', 4, 'Dumbbell overhead triceps Extensions', 'Bicep Brachii');

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
  vhl.add(VolumeHist(10800, 0102));
  vhl.add(VolumeHist(11600, 0408));
  vhl.add(VolumeHist(12070, 0812));
  vhl.add(VolumeHist(9400, 1016));
  return vhl;
}
///template population function
List<WorkoutTemplate> PopulateTemplates() {

  ///List of templates
  List<WorkoutTemplate> tl = [];

  ///workout template creation
  final WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
  final WorkoutTemplate Leg = WorkoutTemplate('Legs');
  final WorkoutTemplate BaB = WorkoutTemplate('Back and Biceps');

  ///Add to List
  tl.add(CaT);
  tl.add(Leg);
  tl.add(BaB);

  ///Return list
  return tl;
}

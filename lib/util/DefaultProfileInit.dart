import 'package:lightweight/util/Exercise.dart';
import 'package:lightweight/util/Workout.dart';
import 'package:lightweight/util/Profile.dart';

Profile CreateDefault(){
  Profile defaultUserProfile = Profile('Default User');
  defaultUserProfile.Saved_templates = PopulateTemplates();
  return defaultUserProfile;
}

List<WorkoutTemplate> PopulateDefault() {
  List<WorkoutTemplate> dtl = [];
  final WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
  final WorkoutTemplate Leg = WorkoutTemplate('Legs');
  final WorkoutTemplate BaB = WorkoutTemplate('Back and Biceps');

  final ExerciseTemplate BP = ExerciseTemplate('Bench Press', 3, 'Barbell Bench press', 'Pectoralis Major');
  final ExerciseTemplate CF = ExerciseTemplate('Chest Flys', 3, 'Dumbbell flys', 'Pectoralis Major');
  final ExerciseTemplate TE = ExerciseTemplate('Triceps Extensions', 3, 'Dumbbell overhead triceps Extensions', 'Triceps Brachii');

  CaT.Exercise_templates.add(BP);
  CaT.Exercise_templates.add(CF);
  CaT.Exercise_templates.add(TE);

  dtl.add(CaT);
  dtl.add(Leg);
  dtl.add(BaB);
  return dtl;
}

List<WorkoutTemplate> PopulateTemplates() {
  List<WorkoutTemplate> tl = [];
  final WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
  final WorkoutTemplate Leg = WorkoutTemplate('Legs');
  final WorkoutTemplate BaB = WorkoutTemplate('Back and Biceps');

  tl.add(CaT);
  tl.add(Leg);
  tl.add(BaB);
  return tl;
}

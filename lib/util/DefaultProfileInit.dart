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
  final ExerciseTemplate TE = ExerciseTemplate('Triceps Extensions', 4, 'Dumbbell overhead triceps Extensions', 'Triceps Brachii');

  Leg.Exercise_templates.add(BP);
  Leg.Exercise_templates.add(CF);
  Leg.Exercise_templates.add(TE);

  final ExerciseTemplate LE = ExerciseTemplate('Leg Extensions', 4, 'Cable Machine Leg extensions', 'Quadriceps Femoris');
  final ExerciseTemplate LC = ExerciseTemplate('Leg Curls', 4, 'Cable Machine Leg curls', 'Biceps Femoris');
  final ExerciseTemplate BS = ExerciseTemplate('Back Squats', 3, 'Barbell Back Squats', 'Quadriceps Femoris');

  BaB.Exercise_templates.add(LE);
  BaB.Exercise_templates.add(LC);
  BaB.Exercise_templates.add(BS);

  final ExerciseTemplate R = ExerciseTemplate('Rows', 3, 'Chest Supported Dumbbell rows', 'Trapezius');
  final ExerciseTemplate BF = ExerciseTemplate('Back Flys', 3, 'Reverse Dumbbell flys', 'Deltoid');
  final ExerciseTemplate BC = ExerciseTemplate('Bicep Curls', 4, 'Dumbbell overhead triceps Extensions', 'Bicep Brachii');

  CaT.Exercise_templates.add(R);
  CaT.Exercise_templates.add(BF);
  CaT.Exercise_templates.add(BC);

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

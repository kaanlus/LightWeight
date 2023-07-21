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

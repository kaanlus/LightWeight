import 'package:lightweight/util/Workout.dart';


List<WorkoutTemplate> Populate() {
  List<WorkoutTemplate> dtl = [];
    final WorkoutTemplate CaT = WorkoutTemplate('Chest and Triceps');
    final WorkoutTemplate Leg = WorkoutTemplate('Legs');
    final WorkoutTemplate BaB = WorkoutTemplate('Back and Biceps');

    dtl.add(CaT);
    dtl.add(Leg);
    dtl.add(BaB);
    return dtl;
}

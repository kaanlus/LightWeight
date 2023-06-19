/*
 * -------------------------------------------------------------------------------------
 *  _      _       _     _    __          __  _       _     _
 * | |    (_)     | |   | |   \ \        / / (_)     | |   | |       /\
 * | |     _  __ _| |__ | |_   \ \  /\  / /__ _  __ _| |__ | |_     /  \   _ __  _ __
 * | |    | |/ _` | '_ \| __|   \ \/  \/ / _ \ |/ _` | '_ \| __|   / /\ \ | '_ \| '_ \
 * | |____| | (_| | | | | |_     \  /\  /  __/ | (_| | | | | |_   / ____ \| |_) | |_) |
 * |______|_|\__, |_| |_|\__|     \/  \/ \___|_|\__, |_| |_|\__| /_/    \_\ .__/| .__/
 *            __/ |                              __/ |                    | |   | |
 *           |___/                              |___/                     |_|   |_|
 *
 * -------------------------------------------------------------------------------------
 * Application Function:
 *  This applications functions as an interface for users to create and track previous and future workouts
 *    The app will allow for users to develop a new routine in the gym or fortify an existing workout routine
 *
 * Key Features:
 *  - Premade Exercises
 *  - Premade Workouts
 *  - Exercise log
 *  - Workout builder
 *  - Workout log
 *  - Set timer
 *  - Data Persistence
 *
 * Optional Features:
 *  - Workout suggestions
 *  - Progress projection
 *  - Accounts
 *
 */
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light Weight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Light Weight Home'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 15 widgets that display their index in the List.
        children: List.generate(15, (index) {
          return Center(
            child: ElevatedButton(
              child: Text('Workout ${index + 1}'),
              onPressed: () {
                Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => WorkoutPage(number: index+1),
              ),
              );},
            ),
          );
        }),
      ),
    );
  }
}

class WorkoutPage extends StatelessWidget {
  WorkoutPage({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Workout ${this.number}'),
        ),
        body: Center(
        child: Text('Workout Here')
      ),
    );
  }
}

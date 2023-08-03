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
import 'package:lightweight/pages/HomePage.dart';
import 'package:lightweight/pages/LogInPage.dart';
import 'package:lightweight/util/DefaultProfileInit.dart';
import 'package:lightweight/util/Profile.dart';



//starts app in the main function
void main() => runApp(const MyApp());


/*
 * -----------------------------------------------
 * Main Page
 * Contents:
 *  - App start
 *
 * -----------------------------------------------
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Profile user = CreateDefault();
    return MaterialApp(
      //title
      title: 'Light Weight',
      //App bar color
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //call to home page
      home: LoginPage()
    );
  }
}



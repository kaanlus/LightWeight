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
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

//starts app in the main function
void main() => runApp(MyApp());


/*
 *
 * Class for calling the main page
 * title: Light Weight
 * calls home page class with:
 * home page title: Light Weight Home
 *
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title
      title: 'Light Weight',
      //App bar color
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //call to home page
      home: HomePage(title: 'Light Weight Home'),
    );
  }
}

/*
 *
 * Class of main page
 * builds a two column scroll widget containing workout buttons that lead to new pages
 * carries context of button pressed into new page
 * New page contains a timer set to 30 seconds
 *
 */
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title
        title: Text(title),
      ),
      body: GridView.count(
        // Create a grid with 2 columns.
        crossAxisCount: 2,
        // Generate 15 widgets that display their index in the List.
        children: List.generate(15, (index) {
          return Center(
            child: ElevatedButton(
              child: Text('Workout ${index + 1}'),
              //on button press take user to the workout page using the navigator
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


/*
 *
 * Class that calls the stated workout page
 *
 */
class WorkoutPage extends StatefulWidget {
  final int number;

  /// Home page
  WorkoutPage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  WorkoutPageState createState() => WorkoutPageState();
}

/*
 *
 * Class of the workout page
 * Workout page contains:
 *    Timer of 30 seconds
 *
 */
class WorkoutPageState extends State<WorkoutPage> {

  // Timer controller
  final CountdownController _controller =
    new CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //button context workout number
          'Workout ${widget.number}',
        ),
      ),
      body: Center(
        child: Column(
          // Creates a row of control buttons that interact with the timer controller
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Start
                  ElevatedButton(
                    child: Text('Start'),
                    onPressed: () {
                      _controller.start();
                    },
                  ),
                  // Pause
                  ElevatedButton(
                    child: Text('Pause'),
                    onPressed: () {
                      _controller.pause();
                    },
                  ),
                  // Resume
                  ElevatedButton(
                    child: Text('Resume'),
                    onPressed: () {
                      _controller.resume();
                    },
                  ),
                  // Stop
                  ElevatedButton(
                    child: Text('Restart'),
                    onPressed: () {
                      _controller.restart();
                    },
                  ),
                ],
              ),
            ),
            Countdown(
              // Timer controller
              controller: _controller,
              // Timer duration
              seconds: 30,
              // Format stored time into text format
              build: (_, double time) => Text(
                time.toString(),
                style: TextStyle(
                  fontSize: 100,
                ),
              ),
              interval: Duration(milliseconds: 100),
              // On timer finish pop up with a notification
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Timer is done!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
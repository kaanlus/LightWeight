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
import 'package:counter_button/counter_button.dart';


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
        primarySwatch: Colors.red,
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
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  int numWorkouts = 9;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Display user profile',
      style: optionStyle,
    ),
    Text(
      'Display user lifting history',
      style: optionStyle,
    ),
    Text(
      'Display all workouts',
      style: optionStyle,
    ),
    Text(
      'Display user goals',
      style: optionStyle,
    ),
    Text(
      'Calculator with rep measurements',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0) {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
        );
      }else if(_selectedIndex == 1) {
        /*
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => BacklogPage(),
        ),
        );
         */
      }
      else if(_selectedIndex == 2) {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
        );
      }
      else if(_selectedIndex == 3) {
        /*
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => Goals(),
        ),
        );
         */
      }
      else if(_selectedIndex == 4) {
        /*
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => RepCalc(),
        ),
        );
         */
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title
        title: Text(widget.title),
      ),
      body:
          Stack( children :[
              Align(
                alignment: Alignment.topCenter,
                child:
                Padding(
                  padding: EdgeInsets.only(top: 130.0 ),
                  child: ElevatedButton( child: Text('\t\t\tStart Empty Workout\t\t\t'), onPressed: () {Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => WorkoutPage(number: -1),
                  ),);}),),),

              Align(
                  alignment: Alignment.topCenter,
                  child:
                  Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text('Workout',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 70),),),),

              Align(
                  alignment: Alignment.topCenter,
                  child:
                  Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Text('My Templates',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),),

              Align(
                  alignment: Alignment.topCenter,
                  child:
                  Padding(
                        padding: EdgeInsets.only( left: 10, right: 10, top: 255.0, bottom: 205.0),
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          // Create a grid with 3 columns.
                          crossAxisCount: 3,
                          // Generate 15 widgets that display their index in the List.
                          children: List.generate(numWorkouts, (index) {
                            return ElevatedButton(
                                child: Text('Workout ${index + 1}'),
                                //on button press take user to the workout page using the navigator
                                onPressed: () {
                                  Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) => WorkoutPage(number: index+1),
                                ),
                                );},
                            );
                          }),
                        ),
                      ),),
              Align(
                  alignment: Alignment.topCenter,
                  child:
                  Padding(
                          padding: EdgeInsets.only(top: 540.0),
                          child: Text('Workout Templates',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),),
              Align(
                  alignment: Alignment.topCenter,
                  child:
                      Padding( padding: EdgeInsets.only( left: 10, right: 10 ,top: 590.0),
                      child:
                       GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          // Create a grid with 2 columns.
                          crossAxisCount: 3,
                          children: [
                            ElevatedButton( child: Text('Chest and Triceps'), onPressed: () {
                              Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => WorkoutPage(number: -1),
                            ),
                            );}),
                            ElevatedButton( child: Text('Legs'), onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => WorkoutPage(number: -1),
                              ),
                              );}),
                            ElevatedButton( child: Text('Back and Biceps'), onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => WorkoutPage(number: -1),
                              ),
                              );}),
                          ],),
                        )),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        /// Bottom nav bar consists of icons, labels, and the fixed
        /// just makes it so that all buttons are visible
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Backlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Goals ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Rep Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatefulWidget{


  ProfilePage({Key? key,}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{

  final String profilename = 'default user 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //button context workout number
          '$profilename\'s profile',
        ),
      ),
    );
  }
}

class ExercisePage extends StatefulWidget{

  final int number;

  /// Home page
  ExercisePage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  ExercisePageState createState() => ExercisePageState();

}

class ExercisePageState extends State<ExercisePage>{
  /*
   * Timer Code sourced from GitHub:
   *  https://github.com/DizoftTeam/simple_count_down/blob/master/example/lib/main.dart
   */
  // Timer controller
  final CountdownController _controller =
  new CountdownController(autoStart: false);

  int _counterValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //button context workout number
          'Exercise ${widget.number}',
        ),
      ),
      body: Center(
        child: Column(
          // Creates a row of control buttons that interact with the timer controller
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Set Timer',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 80),),
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
            Text('Sets Done',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 42),),
            CounterButton(
              loading: false,
              onChange: (int val) {
                setState(() {
                  _counterValue = val;
                });
              },
              count: _counterValue,
              countColor: Colors.red,
              buttonColor: Colors.red,
              progressColor: Colors.red,
            ),
            Text('~~ exercise description goes here ~~',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
          ],
        ),
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

  /*
   * Timer Code sourced from GitHub:
   *  https://github.com/DizoftTeam/simple_count_down/blob/master/example/lib/main.dart
   */
  // Timer controller
  final CountdownController _controller =
    new CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.number >= 0?
        Text(
          //button context workout number
          'Workout ${widget.number}'):
            Text('New Workout'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns.
        crossAxisCount: 3,
        // Generate 15 widgets that display their index in the List.
        children: List.generate(9, (index) {
          return Center(
            child: ElevatedButton(
              child: Text('Exercise ${index + 1}'),
              //on button press take user to the workout page using the navigator
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ExercisePage(number: index+1),
                ),
                );},
            ),
          );
        }),
      ),
    );
  }
}
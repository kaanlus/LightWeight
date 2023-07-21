import 'package:flutter/material.dart';
import 'package:lightweight/pages/ProfilePage.dart';
import 'package:lightweight/main.dart';
import 'package:lightweight/pages/WorkoutPage.dart';

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
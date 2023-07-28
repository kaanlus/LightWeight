import 'package:flutter/material.dart';
import 'package:lightweight/pages/AddWorkoutPage.dart';
import 'package:lightweight/pages/ProfilePage.dart';
import 'package:lightweight/pages/WorkoutPage.dart';
import 'package:lightweight/util/Workout.dart';
import 'package:lightweight/util/Profile.dart';
import 'package:lightweight/util/DefaultProfileInit.dart';

import 'GoalPage.dart';
import 'RepCalcPage.dart';

/*
 * -----------------------------------------------
 * Home Page
 * Contents:
 *  - New workout template button
 *  - List of workout templates
 *  - List of 3 default templates
 *
 * -----------------------------------------------
 */
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title, required this.pf});
  final String title;
  Profile pf;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///index of bottom bar selection on open
  int _selectedIndex = 2;
  ///populates default user profile for testing and demo

  ///populates default templates
  List<WorkoutTemplate> defaultTemplates = PopulateDefault();

  ///Decides what happens when bottom navigation bar is selected
  void _onItemTapped(int index) {
    setState(() {

      ///index of button rendered as selected/previously selected
      _selectedIndex = index;

      ///Profile page button
      if(_selectedIndex == 0) {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => ProfilePage(pf: widget.pf),
        ),
        );
      }

      ///Workout log button
      else if(_selectedIndex == 1) {
        /*
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => BacklogPage(),
        ),
        );
         */
      }

      ///Workouts button
      else if(_selectedIndex == 2) {
        ///empty space
      }

      ///Goal page button
      else if(_selectedIndex == 3) {

        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => GoalPage(pf: widget.pf),
        ),
        );

      }

      ///1RM Calculator page
      else if(_selectedIndex == 4) {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => RepCalcPage(),
        ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Profile user = widget.pf;
    int len = user.Saved_templates.length;
    return Scaffold(
      appBar: AppBar(
        //title
        title: Text(widget.title),
      ),
      body:
      Stack( children :[

        ///Centered workout label
        const Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Workout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
            ),
          ),
        ),

        ///Empty workout button
        Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: const EdgeInsets.only(top: 130.0 ),
            child:
              ElevatedButton( child: const Text('\t\t\tCreate New Workout\t\t\t'),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => AddWorkout(pf: user),
                    ),
                  );
                }
              ),
          ),
        ),


        ///Users saved templates title
        const Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Text('My Templates',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),

        ///Renders buttons navigating a users stored templates
        Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: const EdgeInsets.only( left: 10, right: 10, top: 255.0, bottom: 205.0),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // Create a grid with 3 columns.
              crossAxisCount: 3,
              // Generate 15 widgets that display their index in the List.
              children: List.generate(len, (index) {
                return ElevatedButton(
                  child: Text(user.Saved_templates[index].Get_name()),
                  //on button press take user to the workout page using the navigator
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => WorkoutPage(index: index, pf: user),
                    ),
                    );},
                );
              }),
            ),
          ),
        ),

        ///Default templates title
        const Align(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.only(top: 540.0),
            child: Text('Workout Templates',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),

        ///Renders the three default workout templates
        Align(
            alignment: Alignment.topCenter,
            child:
            Padding( padding: const EdgeInsets.only( left: 10, right: 10 ,top: 590.0),
              child:
              GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // Create a grid with 2 columns.
                crossAxisCount: 3,
                children: [
                  ElevatedButton( child: Text(defaultTemplates[0].Get_name()), onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => WorkoutPage(index: -2, pf: user),
                    ),
                    );}),
                  ElevatedButton( child: Text(defaultTemplates[1].Get_name()), onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => WorkoutPage(index: -3, pf: user),
                    ),
                    );}),
                  ElevatedButton( child: Text(defaultTemplates[2].Get_name()), onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => WorkoutPage(index: -4, pf: user),
                    ),
                    );}),
                ],),
            )),
      ]),

      ///Render options for the bottom navigation bar
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
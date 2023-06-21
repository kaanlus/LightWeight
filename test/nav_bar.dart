import 'package:flutter/material.dart';

/// Bottom Navigation Bar for Light Weight.

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}
/// Code for the pages themselves
class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
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
/// Makes buttons clickable
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
/// Code for the top bar (Might not need can decide later)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///Code for top of the bar (probably change color later on)
        title: const Text('Light Weight'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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

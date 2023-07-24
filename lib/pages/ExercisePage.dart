import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:counter_button/counter_button.dart';
import 'package:timer_count_down/timer_controller.dart';


/*
 * -----------------------------------------------
 * Exercise Page
 * Contents:
 *  -
 *
 * -----------------------------------------------
 */
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
                      _controller.pause();
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
                _controller.restart();
                _controller.pause();
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
                  val < 0?
                  _counterValue = 0 :
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
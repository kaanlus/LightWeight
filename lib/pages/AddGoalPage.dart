import 'package:flutter/material.dart';
import 'package:lightweight/pages/GoalPage.dart';
import 'package:lightweight/util/Goal.dart';

import '../util/Profile.dart';

/*
 * -----------------------------------------------
 * Goals Page
 * Contents:
 *  - Active Goals
 *  - Previous Goals
 *
 * -----------------------------------------------
 */
class AddGoalPage extends StatefulWidget {

  AddGoalPage({
    Key? key,
    required this.pf,
  }) : super(key: key);
  final Profile pf;

  @override
  AddGoalPageState createState() => AddGoalPageState();
}


class AddGoalPageState extends State<AddGoalPage> {
  List<String> listitems = [];
  String? exr = 'Bench Press';
  TextEditingController weightController = TextEditingController();
  TextEditingController timesController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    Profile pro = widget.pf;
    listitems = [];
    for (int i = 0; i < pro.Saved_exercises.length; i++){
        listitems.add(pro.Saved_exercises[i].Get_name());
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Goals'),
      ),
      body: Stack(
          children : [
            const Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('Add New Goal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 110, left: 25),
                child:
                Text('Exercise',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 145),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    value: exr,
                    onChanged: (String? newValue) {
                      setState(() {
                        exr = newValue;
                      });
                    },
                    items: listitems.map((item){
                      return DropdownMenuItem(
                          value: item,
                          child: Text(item)
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 220, left: 25),
                child:
                Text('Weight Goal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 255),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  TextFormField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Weight'
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 330),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  ElevatedButton(
                    child: const Text('Set PR Goal'),
                    onPressed: () {
                      Navigator.pop(context, Goal(false, 0, DateTime.utc(0000), exr!, double.parse(weightController.text)));
                    },
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 410, left: 25),
                child:
                Text('Times to go to the gym',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 445),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  TextFormField(
                    controller: timesController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                          hintText: 'Times to go'
                    ),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(top: 515, left: 25),
                child:
                Text('Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 545),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  TextFormField(
                    readOnly: true,
                    controller: dateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date'
                    ),
                    onTap: () async {
                      pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:DateTime(2000),
                          lastDate: DateTime(2101),
                      );
                      if(pickedDate != null){
                        setState(() {
                          dateController.text = ToDate(pickedDate!);
                        });
                      }
                    },
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 630),
                child:
                SizedBox(
                  width: 370,
                  height: 60,
                  child:
                  ElevatedButton(
                    child: const Text('Set Consistency Goal'),
                    onPressed: () {
                      Navigator.pop(context, Goal(true, int.parse(timesController.text), pickedDate!, '', 0.0));
                    },
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
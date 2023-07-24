import 'package:flutter/material.dart';

/*
 * -----------------------------------------------
 * Goals Page
 * Contents:
 *  1RM calculator
 *
 * -----------------------------------------------
 */
class RepCalcPage extends StatefulWidget {

  const RepCalcPage({
    Key? key,
  }) : super(key: key);

  @override
  RepCalcPageState createState() => RepCalcPageState();
}

class RepCalcPageState extends State<RepCalcPage> {

  ///Options for drop down menu on 1RM Calculator
  List<String> listitems = ['lb', 'kg'];

  ///Default selected option on dropdown menu
  String? sel = 'lb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1RM Calculator'),
      ),
      body: Stack(
          children : [

            ///1RM Title
            const Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('1RM Calculator',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),

            ///Row for weight
            Row(
              children : [
              ///Label for weight input
              const Padding(
                padding: EdgeInsets.only(top: 115, left: 20),
                child: Text('Weight:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),

              ///Input field for weight
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 115),
                child:
                  SizedBox(
                    width: 100,
                    height: 40,
                    child:
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                ),
              ),

              ///Drop down menu for weight units
              Padding(
                  padding: const EdgeInsets.only(top: 115, left:15),
                  child: DropdownButton(
                      value: sel,
                      onChanged: (String? newValue) {
                        setState(() {
                          sel = newValue;
                        });
                      },
                      items: listitems.map((item){
                        return DropdownMenuItem(
                            value: item,
                            child: Text(item)
                        );
                      }).toList(),
                  ),
              )
            ]
            ),

            ///Row for reps
            Row(
                children : [

                  ///Label for reps input
                  const Padding(
                    padding: EdgeInsets.only(top: 205, left: 20),
                    child: Text('Reps:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),

                  ///Input field for reps
                  Padding(
                    padding: const EdgeInsets.only(left: 54, top: 205),
                    child:
                    SizedBox(
                      width: 100,
                      height: 40,
                      child:
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
            ]),

            ///Calculate button
            Align(
              alignment: Alignment.center,
              child:
                SizedBox(
                  width: 300,
                  height: 50,
                  child:
                    ElevatedButton(
                        child: const Text('Calculate'),
                        onPressed: () {  },
                    )
                ),
            ),
          ]
      ),
    );
  }
}
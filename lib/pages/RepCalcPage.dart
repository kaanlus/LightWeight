import 'package:flutter/material.dart';

import '../util/Profile.dart';

class RepCalcPage extends StatefulWidget {

  RepCalcPage({
    Key? key,
  }) : super(key: key);

  @override
  RepCalcPageState createState() => RepCalcPageState();
}

class RepCalcPageState extends State<RepCalcPage> {
  List<String> listitems = ['lb', 'kg'];
  String? sel = 'lb';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1RM Calculator'),
      ),
      body: Stack(
          children : [
            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('1RM Calculator',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),
            Row(
              children : [
              Padding(
                padding: EdgeInsets.only(top: 115, left: 20),
                child: Text('Weight:',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 115),
                child:
                  SizedBox(
                    width: 100,
                    height: 40,
                    child:
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 115, left:15),
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
            Row(
                children : [
                  Padding(
                    padding: EdgeInsets.only(top: 205, left: 20),
                    child: Text('Reps:',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 54, top: 205),
                    child:
                    SizedBox(
                      width: 100,
                      height: 40,
                      child:
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
            ]),
            Align(
              alignment: Alignment.center,
              child:
                SizedBox(
                  width: 300,
                  height: 50,
                  child:
                    ElevatedButton(
                        child: Text('Calculate'),
                        onPressed: () {  },
                    )
                ),
            ),
          ]
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../util/DefaultProfileInit.dart';
import '../util/Profile.dart';
import 'HomePage.dart';

/*
 * -----------------------------------------------
 * Login Page
 * Contents:
 *
 * -----------------------------------------------
 */
class LoginPage extends StatefulWidget {

  LoginPage({
    Key? key,
  }) : super(key: key);


  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Stack(
          children : [
            const Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('Select a user',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child:
                    ListView.builder(
                        itemCount: 0,
                        itemBuilder: (BuildContext context, int index){
                          return ElevatedButton(
                            child: Text(''),
                            onPressed: () {},
                          );
                        }),
                ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 740.0),
                child:
                  ElevatedButton(
                    child: const Text('default user ( Testing )'),
                    onPressed: () {
                      Profile user = CreateDefault();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(title: 'Light Weight Home', pf: user)));
                    },
                  ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 675.0),
                child:
                ElevatedButton(
                  child: const Text('Create New User'),
                  onPressed: () {
                    Profile user = Profile(nameController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(title: 'Light Weight Home', pf: user)));
                  },
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: const EdgeInsets.only(top: 625),
                child:
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      border: const OutlineInputBorder(),
                      hintText: 'Name Here',
                    ),
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../util/DefaultProfileInit.dart';
import '../util/Profile.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'HomePage.dart';
import '../util/Profile_IO.dart';

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
  List<Profile> profiles = [];

  @override
  void initState() {
    super.initState();
    loadProfiles();
  }

  void loadProfiles() async {
    profiles = await readProfiles();
    setState(() {});
  }


  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Stack(
          children: [
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
                    itemCount: profiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        child: Text(profiles[index].Get_name()),
                        onPressed: () {
                          ProfileObserver.profile = profiles[index];
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              HomePage(title: 'Light Weight Home',
                                  pf: profiles[index])));
                        },
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
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>
                            HomePage(title: 'Light Weight Home', pf: user)));
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

                    // Read existing profiles
                    readProfiles().then((profiles) {
                      // Check if the name already exists or is empty
                      if (profiles.any((profile) =>
                      profile.Get_name() == user.Get_name())
                          || nameController.text.trim() == '') {
                        // Show a dialog to inform the user
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Name Exists or Invalid Name!'),
                              content: Text(
                                  'A user with this name already exists or the name does not contain any characters. Please choose another name.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Save the new profile and navigate
                        writeProfile(user).then((_) {
                          ProfileObserver.profile = user;
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => HomePage(
                                  title: 'Light Weight Home', pf: user)));
                        });
                      }
                    });
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
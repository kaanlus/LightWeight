import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'Profile.dart';
import 'package:flutter/material.dart';



//Path Loading functionalities
Future<File> get localFile async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/profiles.json');
}

Future<List<Profile>> readProfiles() async {
  try {
    final file = await localFile;
    String contents = await file.readAsString();
    List<dynamic> jsonData = json.decode(contents);
    return jsonData.map((profile) => Profile.fromJson(profile)).toList();
  } catch (e) {
    return [];
  }
}

Future<File> writeProfile(Profile profile) async {
  final directory = await getApplicationDocumentsDirectory();
  List<Profile> profiles = await readProfiles();
  // Check if the profile with the given name already exists
  bool found = false;
  for (int i = 0; i < profiles.length; i++) {
    if (profiles[i].Get_name() == profile.Get_name()) {
      profiles[i] = profile;  // Update the existing profile
      found = true;
      break;
    }
  }

  // If not found, then add the new profile
  if (!found) {
    profiles.add(profile);
  }
  final file = await localFile;
  return file.writeAsString(json.encode(profiles.map((e) => e.toJson()).toList()));
}

class ProfileObserver extends NavigatorObserver {
  static Profile? profile;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if(profile != null) {
      writeProfile(profile!);
    }
    super.didPush(route, previousRoute);
  }

// Similarly, you can override other methods like didPop, didRemove, etc.
}
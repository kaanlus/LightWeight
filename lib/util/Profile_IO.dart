import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'Profile.dart';


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
  profiles.add(profile);
  final file = await localFile;
  return file.writeAsString(json.encode(profiles.map((e) => e.toJson()).toList()));
}
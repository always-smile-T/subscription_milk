import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


/*Future<PersonalInfo> fetchInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('login');
  final response = await http.get(
    Uri.parse('http://doma.hexon.systems:4000/api/users/profile'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
      HttpHeaders.authorizationHeader: "Bearer $token",
    },
  );
  final responseJson = jsonDecode(response.body);
  //print(responseJson);
  return PersonalInfo.fromJson(responseJson);
}*/
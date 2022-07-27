
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('login');
  prefs.remove('uid');
  prefs.remove('id');

}
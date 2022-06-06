import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscription_milk/fbt_app/authenticate/register/register.dart';
import 'package:subscription_milk/fbt_app/fbt_home.dart';
import 'package:subscription_milk/fbt_app/provider/google_sign_in.dart';

import 'authenticate/sign_in/login_page_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
          child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login" ,
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => const FBTAppHomeScreen(),
        "/login": (BuildContext context) => const LoginPage(),
        "/register": (BuildContext context) => const SignUpPage(),
      })) ;
}

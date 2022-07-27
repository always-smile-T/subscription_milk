import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/fbt_app/authenticate/register/register.dart';
import 'package:subscription_milk/fbt_app/blocs/login_bloc.dart';
import 'package:subscription_milk/fbt_app/fbt_home.dart';
import 'package:subscription_milk/fbt_app/provider/google_sign_in.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = LoginBloc();

  bool _showPass = false;
  late bool correct;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() => super.initState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: AppTheme.blue1.withOpacity(0.6),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded, color: AppTheme.blueIcon,)),
                      Center(
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              'FBT',
                              style: TextStyle(
                                fontSize: 36,
                                shadows: const [
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Colors.black38,
                                    offset: Offset(-2, 5.0),
                                  ),
                                ],
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black,
                              ),
                            ),
                            // Solid text as fill.
                            const Text(
                              'FBT',
                              style: TextStyle(
                                fontSize: 36,
                                color: AppTheme.bluePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset("assets/images/logo.png", width: 165, height: 165,),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: StreamBuilder(
                        stream: bloc.emailStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blueIcon,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blueIcon),
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "USERNAME",
                              border: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppTheme.blueIcon),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: AppTheme.blueIcon, fontSize: 15)),
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: bloc.passStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blueIcon,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blueIcon),
                          controller: _passController,
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              border: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.blueIcon),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: AppTheme.blueIcon
                                  , fontSize: 15)),
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: 34,
                          height: 24,
                          child: Image.asset(_showPass ? "assets/images/eye.png" : "assets/images/eye_x.png",),
                        )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                        child: const Text('SIGN IN',
                            style: TextStyle(color: AppTheme.blueIcon, fontWeight: FontWeight.bold)),
                        onPressed: login,
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                Colors.white),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.white70),
                            foregroundColor:
                            // MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                            MaterialStateProperty.all<Color>(
                                Colors.white70),
                            )),
                  ),
                ),
                const
                    Divider(
                      color: AppTheme.blueIcon,
                      height: 0,
                      thickness: 1.5,
                      // indent: 5,
                      //endIndent: 5,
                    ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      icon: const FaIcon(FontAwesomeIcons.google, color: AppTheme.blueIcon,),
                        label: const Text('Sign Up With Google',
                            style: TextStyle(color: AppTheme.blueIcon, fontWeight: FontWeight.bold)),
                        onPressed: (){
                        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.googleLogin();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.white70),
                          foregroundColor:
                          // MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                          MaterialStateProperty.all<Color>(
                              Colors.white70),
                        )),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'FORGOT PASSWORD?',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don’t have a account?',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      }, child: const Text('Register',style: TextStyle(fontSize: 15, color: AppTheme.blueIcon)))
                    ],
                  ),
                ),
              ],
            ),
          )

        //child: Text("data"),
        // SvgPicture.asset('assets/images/logo.svg'),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass; //lay phu dinh
    });
  }

  Widget gotoDashboard(BuildContext context) {
    return const FBTAppHomeScreen();
  }

  //CREATE FUNCTION TO CAL LOGIN POST API
  Future<void> login() async {
    if (_passController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      if (bloc.isValidUsername(_emailController.text) &&
          bloc.isValidPassword(_passController.text)) {
        var response = await http.post(
            Uri.parse("http://www.subcriptionmilk.somee.com/api/FirebaseServices/logincustomer?email="+"${_emailController.text}"+"&password="+"${_passController.text}"),
            );
        print(response.body.toString());
        print(response.statusCode.toString());
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          //Here , i store value or token inside shared preferences
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("uid", body['uidfb']);
          await pref.setInt("id", body['iddb']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: gotoDashboard), (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("wrong email or password")));
        }
      } else {}
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email and password cannot be blank")));
    }
  }
}
//flutter build apk --release

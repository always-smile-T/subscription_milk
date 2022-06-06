import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() => super.initState();

  /*void checkLogin() async{
    //thu cai nay di
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if(val != null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: gotoDashboard), (route) => false);
      Navigator.push(context, MaterialPageRoute(builder: gotoDashboard));
    }
  }*/

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
                          onPressed: () {},
                          icon: Image.asset("assets/images/back.png")),
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
                          cursorColor: AppTheme.blue2,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blue2),
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "USERNAME",
                              border: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppTheme.blue2),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: AppTheme.blue2, fontSize: 15)),
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: bloc.passStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blue2,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blue2),
                          controller: _passController,
                          obscureText: !_showPass,
                          //cho nay true thi giau pass, con failse thi ...
                          //cho nay true thi giau pass
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              border: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.blue2),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: AppTheme.blue2
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
                            style: TextStyle(color: AppTheme.blue2, fontWeight: FontWeight.bold)),
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
                      color: AppTheme.blue2,
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
                      icon: const FaIcon(FontAwesomeIcons.google),
                        label: const Text('Sign Up With Google',
                            style: TextStyle(color: AppTheme.blue2, fontWeight: FontWeight.bold)),
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
                      TextButton(onPressed: (){}, child: const Text('Register',style: TextStyle(fontSize: 15, color: AppTheme.blue2)))
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

  /*Widget gotoDocument(BuildContext context) {
    return const DocumentPage();
    //nay de test o local
  }*/

  Widget gotoDashboard(BuildContext context) {
    return const FBTAppHomeScreen();
  }

  //CREATE FUNCTION TO CAL LOGIN POST API
  Future<void> login() async {
    if (_passController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      if (bloc.isValidUsername(_emailController.text) &&
          bloc.isValidPassword(_passController.text)) {
        var response = await http.post(
            Uri.parse("https://reqres.in/api/login"),
            body: ({
              'email': _emailController.text,
              'password': _passController.text
            }));
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          //print("Login token " + body.toString());
          //ScaffoldMessenger.of(context)
          //   .showSnackBar(SnackBar(content: Text("Token : ${body['access_token']}")));
          //Here , i store value or token inside shared preferences
          //  //SharedPreferences pref = await SharedPreferences.getInstance();
          //  //await pref.setString("login", body['access_token']);
          //Navigator.push(context, MaterialPageRoute(builder: gotoDashboard));
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

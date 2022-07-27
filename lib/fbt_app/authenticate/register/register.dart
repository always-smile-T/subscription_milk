
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/fbt_app/authenticate/sign_in/login_page_screen.dart';
import 'package:subscription_milk/fbt_app/blocs/login_bloc.dart';
import 'package:subscription_milk/fbt_app/provider/google_sign_in.dart';

import '../../../rest_api/rest_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  LoginBloc bloc = LoginBloc();

  bool _showPass = false;
  late bool correct;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void initState() => super.initState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: AppTheme.blue1.withOpacity(0.6),
            child: ListView(
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
                        stream: bloc.nameStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blueIcon,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blueIcon),
                          controller: _nameController,
                          decoration: InputDecoration(
                              labelText: "FULL NAME",
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
                    child: StreamBuilder(
                        stream: bloc.emailStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blueIcon,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blueIcon),
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "EMAIL",
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
                          //cho nay true thi giau pass, con failse thi ...
                          //cho nay true thi giau pass
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
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: bloc.confirmStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: AppTheme.blueIcon,
                          style: const TextStyle(
                              fontSize: 18, color: AppTheme.blueIcon),
                          controller: _confirmController,
                          obscureText: !_showPass,
                          //cho nay true thi giau pass, con failse thi ...
                          //cho nay true thi giau pass
                          decoration: InputDecoration(
                              labelText: "CONFIRM",
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
                        child: const Text('SIGN UP',
                            style: TextStyle(color: AppTheme.blueIcon, fontWeight: FontWeight.bold)),
                        onPressed: (){
                          createAccount(_emailController.text, _passController.text, _nameController.text, bloc, context);
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
                    children: <Widget>[
                      const Text(
                        'you have an account?',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      }, child: const Text('Login',style: TextStyle(fontSize: 15, color: AppTheme.blueIcon)))
                    ],
                  ),
                ),
              ],
            ),
          )
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass; //lay phu dinh
    });
  }
}
//flutter build apk --release

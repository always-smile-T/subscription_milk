import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import '../../authenticate/sign_in/login_page_screen.dart';

class SubScreen extends StatefulWidget {
  const SubScreen({Key? key}) : super(key: key);

  @override
  State<SubScreen> createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: ElevatedButton(onPressed: ()  {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginPage()));
        },
          child: Text('Login First', style: TextStyle(color: AppTheme.blueIcon),),
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(
                AppTheme.blue5),
          ),
        ),
      ),
    );
  }
}
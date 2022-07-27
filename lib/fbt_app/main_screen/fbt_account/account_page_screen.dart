import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_account/profile/profile_page_screen.dart';
import '../../authenticate/logout/logout.dart';
import '../../authenticate/sign_in/login_page_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}



class _AccountScreenState extends State<AccountScreen> {
  int? i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            color: AppTheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text('Account', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: AppTheme.blueIcon,
                  height: 2,
                  thickness: 0.5,
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? token = prefs.getString('uid');
                    if(token.toString() != 'null' ){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));}
                    if(token.toString() == 'null') _showDialog();
                  },
                  highlightColor: AppTheme.blue4,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 24,
                        child: Image.asset('assets/images/account1.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Profile', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: (){
                  },
                  highlightColor: AppTheme.blue4,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 24,
                        child: Image.asset('assets/images/creditCard.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Payment', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: (){
                    print('1');
                  },
                  highlightColor: AppTheme.blue4,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 24,
                        child: Image.asset('assets/images/location.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Address', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: (){},
                  highlightColor: AppTheme.blue4,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 24,
                        child: Icon(Icons.shopping_cart_outlined, color: AppTheme.blueIcon,),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Your Cart', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: (){
                    logout();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Logout successful")));
                  },
                  highlightColor: AppTheme.blue4,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 24,
                        child: Icon(Icons.logout, color: AppTheme.blueIcon,),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Log Out', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (context) => _SystemPadding(
        child:  AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content:  Row(
              children: const <Widget>[
                Text('Login to get ready!'),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),),),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppTheme.blueIcon),
                    overlayColor:
                    MaterialStateProperty.all<Color>(Colors.white70),)),
              ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),),),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppTheme.blueIcon),
                    overlayColor:
                    MaterialStateProperty.all<Color>(Colors.white70),)),]
        ),),
    );
  }
}
class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({ Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return  AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
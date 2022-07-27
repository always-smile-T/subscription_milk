import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/fbt_home.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_account/profile/update_info.dart';
import '../../../../json_to_dart/account/info_only.dart';
import '../../../../rest_api/rest_api.dart';
import '../../../app_theme.dart';
import '../../../authenticate/logout/logout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static String? avatarPath;
  static bool? gender;
  static String? fullname;
  static String? phone;
  static String? email;
  static String? pass;
  static String? _gender;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Info>(
        future: fetchInfo(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data!.data!.isEmpty) {
              return Center(
                child: Text('there are no package at all!!!', style: TextStyle(
                    color: Colors.white, fontSize: 16
                ),),
              );
            } else {
              Data person = snapshot.data!.data![0];
              avatarPath = person.avatar;
              gender = person.gender;
              fullname = person.fullname;
              phone = person.phone;
              email = person.email;
              pass = person.password;
              if (gender == true){
                _gender = 'male';
              } else _gender = 'female';
              return Scaffold(
                backgroundColor: AppTheme.background,
                body: SingleChildScrollView(
                  child: Container(
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
                            IconButton(onPressed: (){
                              Navigator.of(context).pop();
                            },
                                icon: Icon(Icons.arrow_back_rounded, color: AppTheme.blueIcon,)),
                            const SizedBox(
                              width: 15,
                            ),
                            Text('Profile', style: TextStyle(
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
                          height: 30,
                        ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1, color: AppTheme.blueIcon),
                                  ),
                                  child:  ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(80.0)),
                                    child: Image.network(avatarPath.toString()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(fullname.toString() , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                              ],
                            ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              accountButton('assets/images/gender.png','gender',_gender.toString()),
                              const SizedBox(
                                height: 20,
                              ),
                              accountButton('assets/images/mail.png','Email',email.toString()),
                              const SizedBox(
                                height: 20,
                              ),
                              accountButton('assets/images/phone1.png','Phone Number',phone.toString()),
                              const SizedBox(
                                height: 20,
                              ),
                          accountButton('assets/images/block1.png','Password','******'),
                            ],
                          ),),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                                Container(
                                  height: 40,
                                  width: 120,
                                  child: ElevatedButton(onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => PersonalInfoScreen(
                                            id: person.id,
                                            assetPath: avatarPath,
                                            fullname: fullname,
                                            phone: phone,
                                            email: email,
                                            pass: pass,
                                            station: person.station,
                                            gender: gender,
                                            stationID: person.stationId,
                                            packageOrder: person.packageOrders,
                                            address: person.address
                                        )));
                                  },
                                    child: Text('Change Info', style: TextStyle(color: AppTheme.blueIcon),),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppTheme.blue5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 120,
                                  child: ElevatedButton(onPressed: (){
                                    logout();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const FBTAppHomeScreen()), (
                                        route) => false);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text("Logout successful")));
                                  },
                                    child: Text('Log Out', style: TextStyle(color: Colors.white),),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppTheme.blueIcon),
                                    ),
                                  ),
                                ),
                              ],
                        ),
                      ],
                    ),

                  ),
                ),
              );
            }
          }
          /*if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }*/
          return const Center(
            child: Text('Error'),
          );
        });
  }
  Widget accountButton (String imgPath, String title, String profile){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 24,
              child: Image.asset(imgPath),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(title, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
          ],
        ),
        Row(
          children: [
            Text(profile, style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}

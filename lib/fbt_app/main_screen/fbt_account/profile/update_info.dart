import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';

import '../../../../rest_api/rest_api.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key,required this.id, this.assetPath,this.fullname, this.phone,
  this.email, this.pass, this.station, required this.gender ,required this.stationID, required this.packageOrder,this.address}) : super(key: key);
  final assetPath, fullname, phone, email, pass, station, address;
  final int? id, stationID;
  final List? packageOrder;
  final bool? gender;

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState(id, assetPath, fullname, phone, email, pass, station, gender, stationID, packageOrder, address);
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final assetPath, phone, email, pass, station, address;
  final int? id, stationID;
  final List? packageOrder;
  final bool? gender;
  String? fullname;
  _PersonalInfoScreenState(this.id, this.assetPath, this.fullname, this.phone, this.email, this.pass,
      this.station, this.gender, this.stationID, this.packageOrder, this.address);
  final bool Admin = false;
  static TextEditingController _fullNameController = TextEditingController();
  static TextEditingController _addressController = TextEditingController();
  static TextEditingController _phoneNumberController = TextEditingController();
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fullNameController = TextEditingController(text: fullname.toString());
    _addressController = TextEditingController(text: address.toString());
    _phoneNumberController = TextEditingController(text: '${phone}');
    _emailController = TextEditingController(text: '${email}');
    _passController = TextEditingController(text: '${pass}');
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10,),
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppTheme.blueIcon),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(80.0)),
                      child: Image.network(assetPath.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Column(
                      children: [
                        Text(fullname.toString(), style: const TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),textAlign:  TextAlign.center,),
                        const Text('Personal info', style: TextStyle(fontSize: 18, color: Colors.black54),textAlign:  TextAlign.center)
                      ],
                    ),
                  )
                ],
              ),
            ),
            changeInfo('Full Name',_fullNameController, fullname.toString()),
            changeInfo('Address',_addressController, address.toString()),
            changeInfo('Phone',_phoneNumberController, phone.toString()),
            Container(
                height: 40,
                alignment: Alignment.bottomLeft,
                margin:const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: const Text('Email', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),textAlign: TextAlign.start,)
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: AppTheme.blueIcon,
                ),
              ),
              height: 50,
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              alignment: Alignment.centerLeft,
              child: Text('  ' + email.toString(), style: const TextStyle(fontSize: 20, color: Colors.black45),textAlign: TextAlign.start, ),
            ),
            changeInfo('PassWord',_passController, pass.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 20, 25, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      setState((){
                        updateInfo(id, _emailController.text, _passController.text, _fullNameController.text, _phoneNumberController.text,
                            gender, address, stationID, assetPath, Admin, context);
                        fullname = _fullNameController.text;
                      });
                    },
                    child: Text('Change Info', style: TextStyle(color: AppTheme.blueIcon),),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          AppTheme.blue5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              //height: MediaQuery.of(context).padding.bottom,
              height: 70,//MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget changeInfo (title,_conroller, _hintText) {
    return Column(
      children: [
        Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),textAlign: TextAlign.start,)
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: AppTheme.blueIcon,
            ),
          ),
          child: TextField(
            cursorColor: Colors.black,
            style: const TextStyle(
                fontSize: 20, color: Colors.black),
            controller: _conroller,
            decoration: InputDecoration(
              border: const  OutlineInputBorder(borderSide: BorderSide.none),
              hintText: _hintText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
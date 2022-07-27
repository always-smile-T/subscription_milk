
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_account/payment/checkout_page_screen.dart';
import '../../../json_to_dart/account/info_only.dart';
import '../../../json_to_dart/slot.dart';
import '../../../rest_api/rest_api.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key,required this.packageID, this.assetPath, this.milkName, required this.milkPrice, this.description,}) : super(key: key);
  final assetPath, milkName, description;
  final int? milkPrice, packageID;

  @override
  State<CollectionScreen> createState() => _CollectionScreenState(packageID, assetPath, milkName,milkPrice,description);
}

class _CollectionScreenState extends State<CollectionScreen> {
  final assetPath, milkName, description;
  final int? milkPrice, packageID;
  static int slot = 1;
  static int _sta = 1;
  static int pay = 1;

  _CollectionScreenState(this.packageID, this.assetPath,this.milkName,this.milkPrice,this.description,);

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
              return Scaffold(
                backgroundColor: AppTheme.background,
                body: ListView(children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      Text('Create the best choice',
                          style: const TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,)),
                      const SizedBox(width: 20,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Hero(
                      tag: assetPath,
                      child: Image.network(assetPath,
                          height: 200.0, fit: BoxFit.fill)),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(milkName + ' Subscription', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    ),),
                  const SizedBox(height: 10.0),
                  // Do Khoa làm ăn bất lương. k cho cài slot mặc định.
                  // khách hàng làm biết update order thì lỗ kệ khách hàng
                  // nào FBT có tâm thì chỉnh chỗ này k thì thôi :(((
                  /*Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: AppTheme.blueIcon,
                      ),
                    ),
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: ' Slot: ',
                                  style: const TextStyle(fontSize: 20, color: Colors.black45)
                              ),
                              TextSpan(text: _slot[3].description[slot],
                                  style: const TextStyle(fontSize: 20, color: AppTheme.blueIcon)
                              ),
                            ]
                        )),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () {},
                          icon: PopupMenuButton<Menu>(
                              color: AppTheme.blue1,
                              icon: const Icon(Icons.menu, color: AppTheme.blueIcon),
                              onSelected: (Menu item) {
                                setState(() {
                                  if (item == Menu.menuOne) {slot = 1;}
                                  if (item == Menu.menuTwo) {slot = 2;}
                                  else if (item == Menu.menuThree) {slot = 3;}
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<Menu>>[
                                PopupMenuItem<Menu>(
                                  value: Menu.menuOne,
                                  child: Text(
                                    _slot[3].description[1],
                                    style: TextStyle(color: AppTheme.blueIcon),
                                  ),
                                ),
                                PopupMenuItem<Menu>(
                                  value: Menu.menuTwo,
                                  child: Text(_slot[3].description[2],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                                PopupMenuItem<Menu>(
                                  value: Menu.menuThree,
                                  child: Text(_slot[3].description[3],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),*/
                  /*const SizedBox(height: 20.0),
                  const SizedBox(height: 10.0),*/
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: ' Station: ',
                                  style: const TextStyle(fontSize: 16, color: Colors.black45)
                              ),
                              TextSpan(text: _slot[1].description[_sta],
                                  style: const TextStyle(fontSize: 16, color: AppTheme.blueIcon)
                              ),
                            ]
                        )),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () {},
                          icon: PopupMenuButton<Station>(
                              color: AppTheme.blue1,
                              icon: const Icon(Icons.menu, color: AppTheme.blueIcon),
                              onSelected: (Station item) {
                                setState(() {
                                  if (item == Station.s1) {_sta = 1;}
                                  if (item == Station.s2) {_sta = 2;}
                                  if (item == Station.s3) {_sta = 3;}
                                  else if (item == Station.s4) {_sta = 4;}
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<Station>>[
                                PopupMenuItem<Station>(
                                  value: Station.s1,
                                  child: Text(
                                    _slot[1].description[1]+ '\n  ' + _slot[2].description[1],
                                    style: TextStyle(color: AppTheme.blueIcon),
                                  ),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s2,
                                  child: Text(_slot[1].description[2]+ '\n  ' + _slot[2].description[2],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s3,
                                  child: Text(_slot[1].description[3]+ '\n  ' + _slot[2].description[3],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s4,
                                  child: Text(_slot[1].description[4]+ '\n  ' + _slot[2].description[4],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: ' Payment: ',
                                  style: const TextStyle(fontSize: 20, color: Colors.black45)
                              ),
                              TextSpan(text: _slot[0].description[pay],
                                  style: const TextStyle(fontSize: 20, color: AppTheme.blueIcon)
                              ),
                            ]
                        )),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () {},
                          icon: PopupMenuButton<Station>(
                              color: AppTheme.blue1,
                              icon: const Icon(Icons.menu, color: AppTheme.blueIcon),
                              onSelected: (Station item) {
                                setState(() {
                                  if (item == Station.s1) {pay = 1;}
                                  if (item == Station.s2) {pay = 2;}
                                  if (item == Station.s3) {pay = 3;}
                                  else if (item == Station.s4) {pay = 4;}
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<Station>>[
                                PopupMenuItem<Station>(
                                  value: Station.s1,
                                  child: Text(
                                    _slot[0].description[1],
                                    style: TextStyle(color: AppTheme.blueIcon),
                                  ),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s2,
                                  child: Text(_slot[0].description[2],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s3,
                                  child: Text(_slot[0].description[3],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                                PopupMenuItem<Station>(
                                  value: Station.s4,
                                  child: Text(_slot[0].description[4],
                                      style: TextStyle(color: AppTheme.blueIcon)),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 50.0,
                      height: 50.0,
                      /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppTheme.bluePrimary),*/
                      child: ElevatedButton(
                        child: const Center(
                          child: Text(
                            'DONE',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          if(_sta == 0) {
                            _sta = 1;
                          }
                          CheckIDPOrder();
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          int? token = prefs.getInt('idPackage');
                          int? id = prefs.getInt('id');
                          String? uid = prefs.getString('uid');
                          print(token.toString() + '-' + id.toString()+ '-' + uid.toString());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CheckOutScreen(
                                    packageID: packageID,
                                    assetPath: assetPath,
                                    milkName: milkName,
                                    milkPrice: milkPrice,
                                    description: description,
                                    id: person.id,
                                    fullname:person.fullname,
                                    email: person.email,
                                    phone: person.phone,
                                    stationID: _sta,
                                    staTitle: _slot[1].description[_sta],
                                    staAdr: _slot[2].description[_sta],
                                    pay: pay,
                                    wayPay: _slot[0].description[pay],
                                      oderPId: token,
                                  )));
                          SharedPreferences pref = await SharedPreferences.getInstance();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppTheme.blueIcon
                            )
                        ),
                      )
                  ),
                ]),
                // bottomNavigationBar: Container(color: Colors.amber, height: 100,),
              );
            }}
          return const Center(
            child: Text('Error'),
          );
        });
  }
}
List <ListSlot> _slot = [
  //[0]: payment
  ListSlot(description: ["","MoMo","Bank","Visa","ViettelPay"]),
  //[1]: location_title
  ListSlot(description: ["","Chung cư lô A a","Khu Vinhome","Landmark","Chung cư Q9"]),
  //[2]: location_detail
  ListSlot(description: ["","12 Le Loi, Q2","(567 Vo Van Kiet, Q9","37 La Xuan Oai, Q9","86 Dinh Phong Phu, Q9"]),
  //[3]: slot
  ListSlot(description: ["",'6:30-7:00AM','12:00-12:30PM','5:30-6:00PM']),

] ;

enum Menu { menuOne, menuTwo, menuThree }
enum Station {s1, s2, s3, s4}


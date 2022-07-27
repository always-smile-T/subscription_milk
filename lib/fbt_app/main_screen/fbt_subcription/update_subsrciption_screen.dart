import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/json_to_dart/slot.dart';
import '../../../rest_api/rest_api.dart';

class UpdateSubscriptionScreen extends StatefulWidget {
  const UpdateSubscriptionScreen({Key? key, this.packageID, required this.orderID, this.packageName}) : super(key: key);
  final int? orderID, packageID;
  final packageName;

  @override
  State<UpdateSubscriptionScreen> createState() => _UpdateSubscriptionScreenState(packageID, orderID,packageName);
}

class _UpdateSubscriptionScreenState extends State<UpdateSubscriptionScreen> {
  final int? orderID, packageID;
  static int slot = 1;
  static String _slotName = "6:30-7:00AM";
  static int typeID = 1;
  static String typeName = "Sua hat";
  final packageName;

  _UpdateSubscriptionScreenState(this.packageID,this.orderID,this.packageName);

  @override
  Widget build(BuildContext context) {
    List <ListSlot> _slot = [
      //[0]: slot
      ListSlot(description: ['6:30-7:00AM','12:00-12:30PM','5:30-6:00PM']),
      //[1]: collection
      ListSlot(description: ["Sua hat","Sua oc cho","Sua hanh nhan","Sua dau nanh"]),
    ] ;
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
            Text('Create the best for tomorrow',
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,)),
            const SizedBox(width: 20,)
          ],
        ),
        const SizedBox(height: 20,),
        /*Hero(
                      tag: assetPath,
                      child: Image.network(assetPath,
                          height: 200.0, fit: BoxFit.fill)),*/
        const SizedBox(height: 20.0),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(packageName + ' Subscription', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          ),),
        const SizedBox(height: 10.0),
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
                    TextSpan(text: ' Slot: ',
                        style: const TextStyle(fontSize: 20, color: Colors.black45)
                    ),
                    TextSpan(text: _slotName,
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
                        if (item == Menu.menuOne) {slot = 1;
                        _slotName = _slot[0].description[0].toString();
                        }
                        if (item == Menu.menuTwo) {slot = 2;
                        _slotName =_slot[0].description[1].toString();}
                        else if (item == Menu.menuThree) {slot = 3;
                        _slotName = _slot[0].description[2].toString();}
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Menu>>[
                      PopupMenuItem<Menu>(
                        value: Menu.menuOne,
                        child: Text(
                          _slot[0].description[0].toString(),
                          style: TextStyle(color: AppTheme.blueIcon),
                        ),
                      ),
                      PopupMenuItem<Menu>(
                        value: Menu.menuTwo,
                        child: Text(_slot[0].description[1].toString(),
                            style: TextStyle(color: AppTheme.blueIcon)),
                      ),
                      PopupMenuItem<Menu>(
                        value: Menu.menuThree,
                        child: Text(_slot[0].description[2].toString(),
                            style: TextStyle(color: AppTheme.blueIcon)),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const SizedBox(height: 10.0),
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
                    TextSpan(text: ' Collection: ',
                        style: const TextStyle(fontSize: 20, color: Colors.black45)
                    ),
                    TextSpan(text: typeName,
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
                      print(typeName);
                      setState(() {
                        if (item == Station.s1) {typeID = 1;
                        typeName = _slot[1].description[0].toString();}
                        if (item == Station.s2) {typeID = 2;
                        typeName = _slot[1].description[1].toString();}
                        if (item == Station.s3) {typeID = 3;
                        typeName = _slot[1].description[2].toString();}
                        else if (item == Station.s4) {typeID = 4;
                        typeName = _slot[1].description[3].toString();}
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Station>>[
                      PopupMenuItem<Station>(
                        value: Station.s1,
                        child: Text(
                          _slot[1].description[0].toString(),
                          style: TextStyle(color: AppTheme.blueIcon),
                        ),
                      ),
                      PopupMenuItem<Station>(
                        value: Station.s2,
                        child: Text(_slot[1].description[1].toString(),
                            style: TextStyle(color: AppTheme.blueIcon)),
                      ),
                      PopupMenuItem<Station>(
                        value: Station.s3,
                        child: Text(_slot[1].description[2].toString(),
                            style: TextStyle(color: AppTheme.blueIcon)),
                      ),
                      PopupMenuItem<Station>(
                        value: Station.s4,
                        child: Text(_slot[1].description[3].toString(),
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
                UpdateOrder(orderID,packageID,slot,typeID);
                _UpdateDone();
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
  }
  _UpdateDone() async {
    await showDialog<String>(
      context: context,
      builder: (context) => _SystemPadding(
        child:  AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content:  Row(
              children: <Widget>[
                Text('Enjoy This Moment!'),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: const Text('Done'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
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

enum Menu { menuOne, menuTwo, menuThree }
enum Station {s1, s2, s3, s4}


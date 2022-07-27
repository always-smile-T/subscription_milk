
import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';

import '../../../../rest_api/rest_api.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key,required this.packageID, this.assetPath, this.milkName, required this.milkPrice, this.description,
    this.id, this.fullname, this.email, this.phone, this.stationID,
  this.staTitle, this.staAdr, this.pay, this.wayPay, this.oderPId}) : super(key: key);
  final assetPath, milkName, description;
  final int? milkPrice, packageID;
  final String? fullname;
  final String? phone;
  final String? email;
  final int? id, pay, oderPId;
  final int? stationID;
  final staTitle, staAdr, wayPay;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState(packageID,assetPath, milkName,milkPrice,description,
      id, fullname, email, phone, stationID,
      staTitle, staAdr, pay, wayPay, oderPId);
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final assetPath, milkName, description;
  final int? milkPrice, packageID;
  final String? fullname;
  final String? phone, staTitle, staAdr, wayPay;
  final String? email;
  final int? id, pay;
  final int? stationID,oderPId;
  _CheckOutScreenState(this.packageID, this.assetPath, this.milkName, this.milkPrice, this.description,
      this.id, this.fullname, this.email, this.phone, this.stationID,
      this.staTitle, this.staAdr, this.pay, this.wayPay, this.oderPId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
        body: ListView(
          children: [
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
            Text('Check Out',
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,)),
            const SizedBox(width: 20,)
          ],
        ),
            const Divider(
              color: Colors.grey,
              height: 2,
              thickness: 0.5,
            ),
            const SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                    tag: assetPath,
                    child: Image.network(assetPath,
                        height: 150.0, width: 150, fit: BoxFit.fill)),
                const SizedBox(width: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(milkName, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                        Text('Subscription', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ],
                    ),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Price: ', style: TextStyle(
                            color: Colors.grey, fontSize: 16
                        ),
                        ),
                        TextSpan(
                          text: milkPrice.toString(), style: TextStyle(
                            color: AppTheme.price, fontSize: 16
                        ),
                        ),
                      ]
                    )),
                    const SizedBox(height: 5,)
                  ],
                ),
              ],
            ),
          ),
        ),
            const SizedBox(height: 30.0),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Slot', style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),),
                        Text('update everyday', style: const TextStyle(
                            fontSize: 16, color: Colors.black
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Payment', style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),),
                        Text(wayPay.toString(), style: const TextStyle(
                            fontSize: 16, color: AppTheme.price
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Address: ' + staAdr.toString(), style: TextStyle(
                            fontSize: 16
                        ),),
                        Text(staTitle.toString(), style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600
                        ))
                      ],
                    )
                  ],
                )
            ),
        const SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Items', style: TextStyle(
                        color: Colors.grey, fontSize: 14
                      ),),
                      Text(milkName, style: const TextStyle(
                        fontSize: 16, color: Colors.black
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Price', style: TextStyle(
                           fontSize: 16
                      ),),
                      Text(milkPrice.toString(), style: const TextStyle(
                          fontSize: 16, color: AppTheme.price
                      ))
                    ],
                  )
                ],
              )
            ),
        const SizedBox(height: 20.0),
        Container(
            width: MediaQuery.of(context).size.width - 50.0,
            height: 50.0,
            /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppTheme.bluePrimary),*/
            child: ElevatedButton(
              child: const Center(
                child: Text(
                  'Check Out',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () async {
                _checkOut();
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
  _checkOut() async {
    await showDialog<String>(
      context: context,
      builder: (context) => _SystemPadding(
        child:  AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content:  Row(
              children: <Widget>[
                Text('Pay ' + milkPrice.toString() + ' If you want to get it!'),
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
                  child: const Text('Payment'),
                  onPressed: () {
                    CreatePackageOrder(oderPId,fullname,stationID,phone,email,pay,id,packageID,milkPrice,context);
                    _checkOutDone();
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
  _checkOutDone() async {
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
  Widget diaButton (title) {
    return ElevatedButton(
        child: Text(title.toString()),
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
          MaterialStateProperty.all<Color>(Colors.white70),));
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



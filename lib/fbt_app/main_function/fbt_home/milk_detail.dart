import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';

class CookieDetail extends StatelessWidget {
  final assetPath, milkName, milkPrice, milkPackage;

   const CookieDetail({Key? key, this.assetPath, this.milkName, this.milkPrice, this.milkPackage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.bluePrimary,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(milkPackage,
            style: const TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: ListView(children: [
       const SizedBox(height: 15.0),
       const SizedBox(height: 15.0),
        Hero(
            tag: assetPath,
            child: Image.asset(assetPath,
                height: 150.0, width: 100.0, fit: BoxFit.contain)),
        const SizedBox(height: 20.0),
        Center(
          child: Text(milkPrice,
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Text(milkName,
              style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        const SizedBox(height: 20.0),
        Center(
          child:  SizedBox(
            width: MediaQuery.of(context).size.width - 50.0,
            child: const Text(
                'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        const SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: AppTheme.bluePrimary),
                child:const Center(
                    child: Text(
                  'SUBSCRIBE',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))))
      ]),
     // bottomNavigationBar: Container(color: Colors.amber, height: 100,),
    );
  }
}

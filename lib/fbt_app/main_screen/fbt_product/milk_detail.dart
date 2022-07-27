import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/app_theme.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_product/collection_page_screen.dart';
import '../../../rest_api/rest_api.dart';

class MilkDetail extends StatefulWidget {
  const MilkDetail({Key? key, required this.packageID, this.assetPath, this.milkName,
    required this.milkPrice, this.description}) : super(key: key);
  final assetPath, milkName, description;
  final int? milkPrice, packageID;
  @override
  State<MilkDetail> createState() => _MilkDetailState(packageID, assetPath, milkName,milkPrice, description);
}

class _MilkDetailState extends State<MilkDetail> {
  final assetPath, milkName, description;
  final int? milkPrice, packageID;
  _MilkDetailState(this.packageID, this.assetPath, this.milkName,
      this.milkPrice, this.description);
  @override
  Widget build(BuildContext context) {
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
            Text(milkName,
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,)),
            const SizedBox(width: 20,)
          ],
        ),
        const SizedBox(height: 20,),
        Hero(
            tag: assetPath,
            child: Image.network(assetPath,
                height: 200.0, fit: BoxFit.fill)),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(milkName + ' Subscription', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          ),),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(milkPrice.toString()
              ,
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.price)),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
              description,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  color: Color(0xFFB4B8B9))),
        ),
        const SizedBox(height: 20.0),
        Container(
            width: MediaQuery.of(context).size.width - 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppTheme.bluePrimary),

            child: ElevatedButton(
              child: const Center(
                child: Text(
                  'SUBSCRIBE',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: (){
                CheckIDPOrder();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CollectionScreen(
                      packageID: packageID,
                      assetPath: assetPath,
                      milkName: milkName,
                      milkPrice: milkPrice,
                      description: description,
                    )));
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
}


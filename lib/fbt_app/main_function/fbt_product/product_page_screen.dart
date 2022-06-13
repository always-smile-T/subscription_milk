
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/main_function/fbt_home/milk_detail.dart';
import '../../app_theme.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  String? search = "";
  late TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: AppTheme.bluePrimary,
            child: Stack(
              children: [
                getMainListViewUI(),
                getAppBarUI(),
              ],
            ),
          )),
    );
  }

  Widget getMainListViewUI() {
    return Scaffold(
      backgroundColor: AppTheme.bluePrimary,
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 100.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 80.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Nut Milk', 'package 1' , '\$3.99', 'assets/images/milk1.png',
                      false, context),
                  _buildCard('Nut Milk', 'package 2' , '\$6.99', 'assets/images/milk1.png',
                      false, context),
                  _buildCard('Butter Milk', 'package 1' , '\$5.99' ,
                      'assets/images/milk-buy.png', false, context),
                  _buildCard('Butter Milk', 'package 2' , '\$8.99' ,
                      'assets/images/milk-buy.png', false, context),
                  _buildCard('Paneer', 'package 1' , '\$10.99' ,
                      'assets/images/paneer.png', true, context),
                  _buildCard('Paneer', 'package 2' , '\$13.99' ,
                      'assets/images/paneer.png', true, context),
                  _buildCard('Cream', 'package 1' , '\$22.99' ,
                      'assets/images/cream.png', false, context),
                  _buildCard('Cream', 'package 2' , '\$25.99' ,
                      'assets/images/cream.png', false, context)
                ],
              )),
          const SizedBox(height: 70.0)
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
        color: AppTheme.background,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: <Widget>[
            Container(
              height: 40,
              margin: const EdgeInsets.fromLTRB(10, 0, 60, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                controller: _searchController,
                decoration: const InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.blue2),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: 34,
              width: 34,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/notification.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String package, String price, String imgPath,
      bool isFavorite, context) {
    return Padding(
        padding:
        const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      milkName: name,
                    milkPrice: price,
                  milkPackage: package,)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: AppTheme.background),
                child: Column(children: [
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 120.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 7.0),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(package,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 12.0)),
                  Text(price,
                      style: const TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(color:const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('SUBSCRIBE',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: AppTheme.bluePrimary,
                                    fontSize: 12.0))
                          ]))
                ]))));
  }
}


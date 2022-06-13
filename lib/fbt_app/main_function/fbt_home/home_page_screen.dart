import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/main_function/fbt_product/product_page_screen.dart';

import '../../app_theme.dart';
import 'milk_detail.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  String? idFolder = "";
  String? search = "";
  Animation<double>? topBarAnimation;
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _post = <Widget>[];
  bool _setState = true;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  late TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
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
          const SizedBox(height: 120.0),
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
                  _buildCard('Nut Milk', 'assets/images/milk1.png',
                      false, context),
                  _buildCard('Butter Milk',
                      'assets/images/milk-buy.png', false, context),
                  _buildCard('Paneer',
                      'assets/images/paneer.png', true, context),
                  _buildCard('Cream',
                      'assets/images/cream.png', false, context)
                ],
              )),
          const SizedBox(height: 15.0)
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

  Widget _buildCard(String name, String imgPath,
      bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const ProductScreen()),
                    (route) => false);
          },
           /* onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookiename: name)));
            },*/
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
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
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color:const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                               Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                               Text('View Subscription',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                          ]))
                ]))));
  }
}


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_subcription/subcriptin_page_screen.dart';
import 'main_screen/fbt_account/account_page_screen.dart';
import 'main_screen/fbt_home/home_page_screen.dart';
import 'main_screen/fbt_product/product_page_screen.dart';
import 'main_screen/fbt_subcription/sub_screen.dart';
import 'model/bottom_bar_view.dart';
import 'model/tab_icon_data.dart';

class FBTAppHomeScreen extends StatefulWidget {
  const FBTAppHomeScreen({Key? key, this.idTabController}) : super(key: key);
  final idTabController;

  @override
  _FBTAppHomeScreenState createState() => _FBTAppHomeScreenState(idTabController);
}

class _FBTAppHomeScreenState extends State<FBTAppHomeScreen>
    with TickerProviderStateMixin {
  final idTabController;
  _FBTAppHomeScreenState(this.idTabController);
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Colors.white, //bo
  );

  @override
  initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }

    if(idTabController == 1){
      tabIconsList[1].isSelected = true;
    } else if(idTabController == 2){
      tabIconsList[2].isSelected = true;
    }else if(idTabController == 3){
      tabIconsList[3].isSelected = true;
    }
    else {
      tabIconsList[0].isSelected = true;
    }
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('uid');*/

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = idTabController == 1 ? ProductScreen() :
    idTabController == 2 ? SubScreen() :
    idTabController == 3 ? const AccountScreen() : HomePageScreen() ;
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      HomePageScreen();
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = const ProductScreen();
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) async {
                if (!mounted) {
                  return;
                }
                SharedPreferences pref = await SharedPreferences.getInstance();
                int? idUser = await pref.getInt("id");
                setState(() {
                  idUser == null ? tabBody = SubScreen() : tabBody = SubcriptionScreen(idUser: idUser);
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = const AccountScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}

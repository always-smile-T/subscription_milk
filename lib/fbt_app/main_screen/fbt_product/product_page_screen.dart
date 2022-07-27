
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_product/milk_detail.dart';
import 'package:subscription_milk/json_to_dart/package/list_of_packages.dart';
import '../../../rest_api/rest_api.dart';
import '../../app_theme.dart';
import '../../authenticate/sign_in/login_page_screen.dart';
import '../../model/flip_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);


  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  final controller = FlipCardController();
  String? search = "";
  final ScrollController scrollController = ScrollController();
  late TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
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
    return FutureBuilder<ListOfPackages>(
        future: FetchPackage(search.toString()),
        builder: (context, snapshot) {
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
              int item = snapshot.data!.data!.length;
              return Scaffold(
                backgroundColor: AppTheme.bluePrimary,
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 100.0),
                      GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2/3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        scrollDirection: Axis.vertical,
                        itemCount: item,
                        controller: _scrollController,
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Data package = snapshot.data!.data![index];
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                String? token = prefs.getString('uid');
                                if(token.toString() != 'null' ){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MilkDetail(
                                        packageID: package.id,
                                        assetPath: package.img.toString(),
                                        milkName: package.title.toString(),
                                        milkPrice: package.price,
                                        description: package.description.toString(),)));}
                                if(token.toString() == 'null') _showDialog();
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(10),
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
                                        tag: package.img.toString(),
                                          child: SizedBox(
                                            height: 150,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(60),
                                              ),
                                              child: Image.network(package.img.toString(), fit: BoxFit.fill,),
                                            ),
                                          )
                                        ),
                                    const SizedBox(height: 7.0),
                                    Text(package.title.toString(),
                                        style: const TextStyle(
                                            color: Color(0xFF575E67),
                                            fontFamily: 'Varela',
                                            fontSize: 14.0)),
                                    const SizedBox(height: 3.0),
                                    Text(package.price.toString(),
                                        style: const TextStyle(
                                            color: AppTheme.price,
                                            fontFamily: 'Varela',
                                            fontSize: 14.0)),
                                    const SizedBox(height: 3.0),
                                    Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(color:const Color(0xFFEBEBEB), height: 1.0)),
                                    Container(
                                        margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Text('SUBSCRIBE',
                                                  style: TextStyle(
                                                      fontFamily: 'Varela',
                                                      color: AppTheme.blueIcon,
                                                      fontSize: 12.0))
                                            ]))
                                  ])),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 70.0)
                    ],
                  ),
                ),
              );
            }
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },);
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
              child: StreamBuilder(
                  builder: (context, snapshot) => TextField(
                    cursorColor: Colors.black,
                    style: const TextStyle(fontSize: 15),
                    textAlignVertical:
                    TextAlignVertical.bottom,
                    controller: _searchController,
                    //cho nay true thi giau pass, con failse thi ...
                    decoration: const InputDecoration(
                      hintText: "Search Item You Want",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black38),
                      ),
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  )),
            ),
            SizedBox(
              height: 34,
              width: 34,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    search = _searchController.text.toString();
                  });
                },
                icon: Icon(Icons.search, color: AppTheme.blueIcon,),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (context) => _SystemPadding(
        child:  AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content:  Row(
              children: const <Widget>[
                Text('Login to get all of that you want!'),
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
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()));
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

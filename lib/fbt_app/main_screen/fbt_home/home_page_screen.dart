import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_milk/json_to_dart/product/list_of_categories.dart';
import '../../../rest_api/rest_api.dart';
import '../../app_theme.dart';
import '../../fbt_home.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  String? search = "";
  int idTabController = 0;
  final ScrollController scrollController = ScrollController();
  List<Widget> listViews = <Widget>[];
  final ScrollController _scrollController = ScrollController();
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
    return FutureBuilder<ListCategories>(
      future: FetchProduct(search.toString()),
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
                        //widget.animationController?.forward();
                        Data product = snapshot.data!.data![index];
                        return Container(
                          margin: const EdgeInsets.all(5),
                          child: Padding(
                              padding:
                              const EdgeInsets.all(5.0),
                              child: InkWell(
                                  onTap: (){
                                    idTabController = 1;
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => FBTAppHomeScreen(
                                          idTabController: idTabController,)));
                                  },
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
                                            tag: product.img.toString(),
                                            child: SizedBox(
                                              height: 150,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                                child: Image.network(product.img.toString(), fit: BoxFit.fill,),
                                              ),
                                            )
                                        ),
                                        const SizedBox(height: 7.0),
                                        Text(product.title.toString(),
                                            style: const TextStyle(
                                                color: Color(0xFF575E67),
                                                fontFamily: 'Varela',
                                                fontSize: 14.0,
                                            fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 7.0),
                                        Text(product.description.toString(), overflow: TextOverflow.clip,
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
                                      ])))),
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

}


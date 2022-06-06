import 'package:flutter/material.dart';

class SubcriptionScreen extends StatefulWidget {
  const SubcriptionScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _SubcriptionScreenState createState() => _SubcriptionScreenState();
}

class _SubcriptionScreenState extends State<SubcriptionScreen>
    with TickerProviderStateMixin {
  String? search = "";
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  double topBarOpacity = 0.0;

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
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: getAppBarUI(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: getMainListViewUI(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return const Text("ahihi chua lam gi a");
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'My Document',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //fontFamily: DomaAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          //////////////////////////
                          // cho nay de breadcrumbs
                          //////////////////////////
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "My Documents",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: SizedBox(
                          width: 250,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              StreamBuilder(
                                  builder: (context, snapshot) => TextField(
                                        cursorColor: Colors.black,
                                        style: const TextStyle(fontSize: 15),
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        controller: _searchController,
                                        //cho nay true thi giau pass, con failse thi ...
                                        decoration: const InputDecoration(
                                          hintText: "Search Document",
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black38),
                                          ),
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )),
                              IconButton(
                                alignment: Alignment.bottomRight,
                                onPressed: () {
                                  setState(() {
                                    search = _searchController.text.toString();
                                  });
                                },
                                icon: const Icon(Icons.search),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

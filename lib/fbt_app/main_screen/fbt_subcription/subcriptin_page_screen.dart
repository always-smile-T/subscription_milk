import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_subcription/subscription_details.dart';
import '../../../json_to_dart/package_orders/package_orders.dart';
import '../../../json_to_dart/slot.dart';
import '../../../rest_api/rest_api.dart';
import '../../app_theme.dart';

class SubcriptionScreen extends StatefulWidget {
  const SubcriptionScreen({Key? key, this.idUser}) : super(key: key);
  final int? idUser;


  @override
  State<SubcriptionScreen> createState() => _SubcriptionScreenState(idUser);
}

class _SubcriptionScreenState extends State<SubcriptionScreen> {
  final int? idUser;
  static int countPackage = 0;
  static int? isIndex = null;
  _SubcriptionScreenState(this.idUser);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageOrderss>(
        future: FetchPacOrder(),
        builder: (context, snapshot){
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
              PackageOrderss package = snapshot.data!;
              List<Dataa> packageOder = snapshot.data!.data!;
              for(int i = 0; i < package.totalitems!; i++){
                if(packageOder[i].customerId == idUser){
                  countPackage = countPackage + 1;
                }
              }
              print(countPackage.toString());
              return Scaffold(
                backgroundColor: AppTheme.background,
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    color: AppTheme.background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Subscription', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: AppTheme.blueIcon,
                          height: 2,
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: package.totalitems,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index){
                          if(packageOder[index].customerId == idUser){
                            int? packageID = packageOder[index].packageId!;
                            int? stationID = packageOder[index].stationId!;
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: AppTheme.blueIcon),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_slot[0].description[packageID] , style: TextStyle(
                                    color: AppTheme.blueIcon, fontWeight: FontWeight.bold, fontSize: 16
                                  ),),
                                  RichText(text: TextSpan(
                                    children: [
                                      TextSpan(text: 'Station: ', style: TextStyle(
                                        color: Colors.grey , fontSize: 12,
                                      )),
                                      TextSpan(text: _slot[1].description[stationID] , style: TextStyle(
                                        color: Colors.black , fontSize: 14,
                                      )),
                                    ]
                                  ),
                                  ),
                                  RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Start Time: ', style: TextStyle(
                                      color: Colors.grey , fontSize: 12,
                                    )),
                                    TextSpan(text: packageOder[index].startTime!.toString() , style: TextStyle(
                                      color: Colors.black , fontSize: 14,
                                    )),
                                  ]
                                ),),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text: 'End Time: ', style: TextStyle(
                                          color: Colors.grey , fontSize: 12,
                                        )),
                                        TextSpan(text: packageOder[index].endTime!.toString() , style: TextStyle(
                                          color: Colors.black , fontSize: 14,
                                        )),
                                      ]
                                  ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => SubcriptionDetailScreen(
                                          packageID: packageOder[index].id!,
                                          packageName: _slot[0].description[packageID],
                                          location: _slot[1].description[stationID],
                                        )));
                                  },
                                      icon: Icon(Icons.more_horiz, color: AppTheme.blueIcon,))
                                ],
                              )
                                ],
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                          ],
                        ),
                  ),
                ),
              );
            }
          }
          return const Center(
            child: Text('Error'),
          );
        });
  }
  List <ListSlot> _slot = [
    //[0]: package
    ListSlot(description: ["","Gói Sữa theo ngày","Gói siêu ưu đãi","Gói sữa xịn","Gói vip"]),
    //[1]: location
    ListSlot(description: ["","Chung cư lô A a (12 Le Loi, Q2)","Khu Vinhome (567 Vo Van Kiet, Q9)","Landmark (37 La Xuan Oai, Q9)","Chung cư Q9 (86 Dinh Phong Phu, Q9)"]),
  ] ;
}

import 'package:flutter/material.dart';
import 'package:subscription_milk/fbt_app/main_screen/fbt_subcription/update_subsrciption_screen.dart';
import '../../../json_to_dart/oders/list_orders.dart';
import '../../../rest_api/rest_api.dart';
import '../../app_theme.dart';

class SubcriptionDetailScreen extends StatefulWidget {
  const SubcriptionDetailScreen({Key? key, this.packageID, this.packageName, this.location}) : super(key: key);
  final int? packageID;
  final packageName, location;


  @override
  State<SubcriptionDetailScreen> createState() => _SubcriptionDetailScreenState(packageID, packageName,location);
}

class _SubcriptionDetailScreenState extends State<SubcriptionDetailScreen> {
  final int? packageID;
  static int? isIndex = null;
  static int count = 0;
  final packageName, location;
  _SubcriptionDetailScreenState(this.packageID, this.packageName, this.location);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(packageID.toString());
    return FutureBuilder<ListOrders>(
        future: FetchOrder(),
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
             /* print(countPackage.toString());*/
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, icon: Icon(Icons.arrow_back_rounded, color: AppTheme.blueIcon,)),
                            Text(packageName, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),const SizedBox(width: 10,)
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
                            itemCount: snapshot.data!.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              List<Datas> odersDetail = snapshot.data!.data!;
                              if (odersDetail[index].pacakeOrderId == packageID) {
                                count = count+1;
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppTheme.blueIcon),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text('Day: ' + count.toString(),style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                )),
                                      Text(packageName, style: TextStyle(
                                          color: AppTheme.blueIcon,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Station: ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                )),
                                            TextSpan(text: location,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                )),
                                          ]
                                      ),
                                      ),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'day: ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                )),
                                            TextSpan(text: 'Thảo chưa làm ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                )),
                                          ]
                                      ),),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Slot: ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                )),
                                            TextSpan(text: "update, please!", style: TextStyle(
                                              color: Colors.black, fontSize: 14,
                                            )),
                                          ]
                                      ),),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Status: ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                )),
                                            TextSpan(text: 'Pending',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                )),
                                          ]
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(onPressed: (){
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateSubscriptionScreen(
                                                        packageID: packageID,
                                                        orderID: odersDetail[index].id,
                                                        packageName: packageName)));
                                            print("oder.id: " + odersDetail[index].id.toString());
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
          } if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        });
  }
}


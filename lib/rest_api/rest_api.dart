import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../fbt_app/authenticate/sign_in/login_page_screen.dart';
import '../json_to_dart/account/info_only.dart';
import '../json_to_dart/list_collections/list_collections.dart';
import '../json_to_dart/oders/list_orders.dart';
import '../json_to_dart/package/list_of_packages.dart';
import '../json_to_dart/package_orders/package_orders.dart';
import '../json_to_dart/product/list_of_categories.dart';
import '../json_to_dart/station/list_slots.dart';



//Account
//1
Future<Info> fetchInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? token = prefs.getInt('id');
  print(token.toString());
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/Accounts/getbyid?id=$token'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  /*print('info nè');
  print(responseJson);*/
  return Info.fromJson(responseJson);
}
Future deleteAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? token = prefs.getInt('id');
  print(token.toString());
  final response = await http.delete(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/Accounts?id=16'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
}
Future updateInfo(id, email, pass, name, phone, gender, address, stationID, assetPath, Admin,context) async {
  var response = await http.put(
      Uri.parse("http://www.subcriptionmilk.somee.com/api/Accounts/update"),

      headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
      body:
      jsonEncode({
        "id": id,
        "email": email,
        "password": pass,
        "fullname": name,
        "phone": phone,
        "gender": gender,
        "address": address,
        "stationId": stationID,
        "avatar": assetPath,
        "isAdmin": Admin,
      })
  );
  //final responseJson = jsonDecode(response.body);
  //print(responseJson);
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Your info has been updated")));
  }else{
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("unsuccessful")));
  }
}
Future<void> createAccount(email, pass, name, bloc, context) async {
  if (pass.isNotEmpty && email.isNotEmpty && name.text.isNotEmpty) {
    if (bloc.isValidUsername(email.text) &&
        bloc.isValidPassword(pass.text)) {
      var response = await http.post(
          Uri.parse(
              "http://www.subcriptionmilk.somee.com/api/Accounts/create"),
          headers: {'Content-Type': 'application/json', 'charset': 'utf-8'},
          body: jsonEncode({
            "email": email,
            "password": pass,
            "fullname": name,
            "phone": "",
            "gender": null,
            "address": "",
            "stationId": null,
            "avatar":
            "https://phunugioi.com/wp-content/uploads/2022/04/Avatar-tiktok-580x362.jpg",
            "isAdmin": false
          }));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register successfully!")));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage()));
    } else {}
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and password cannot be blank")));
  }
}

//Package Order

Future CheckIDPOrder() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/PackageOrders/Getallpackageorder'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    //Here , i store value or token inside shared preferences
    await pref.setInt("idPackage", body["totalitems"]);
  }
}

Future <PackageOrderss> FetchPacOrder() async {
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/PackageOrders/Getallpackageorder'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  /*print('body: ');
  print(responseJson);*/
  return PackageOrderss.fromJson(responseJson);
}

Future CreatePackageOrder( oderPId, fullname, stationID, phone, email, pay, id, packageID, milkPrice, context) async {
  var response = await http.post(
      Uri.parse("http://www.subcriptionmilk.somee.com/api/PackageOrders/create"),
      headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
      body:
      jsonEncode({
        "id": oderPId,
        "startTime": "2022-07-22T00:00:00",
        "endTime": "2022-08-22T00:00:00",
        "fullName": fullname.toString(),
        "stationId": stationID,
        "phone": phone.toString(),
        "email": email.toString(),
        "description": "",
        "paymentId": pay,
        "customerId": id,
        "packageId": packageID,
        "total": milkPrice
      })
  );
  final responseJson = jsonDecode(response.body);
  print(responseJson);
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Your info has been updated")));
  }else{
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("unsuccessful")));
  }
}

//Package

Future<ListOfPackages> FetchPackage(String search) async {
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/Packages/Getallpackages?search=$search'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  //print(responseJson);
  return ListOfPackages.fromJson(responseJson);
}

//Product

//2
Future<ListCategories> FetchProduct(search) async {
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/Products/Getallproduct?search=$search'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  //print(responseJson);
  return ListCategories.fromJson(responseJson);
}

//Station

Future<ListStation> FetchStation(id) async {
  final response = await http.get(
    Uri.parse('http://www.subcriptionmilk.somee.com/api/Products/Getallproduct?id=$id'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  return ListStation.fromJson(responseJson);
}

//Order

Future <ListOrders> FetchOrder() async {
  var response = await http.get(
    Uri.parse("http://www.subcriptionmilk.somee.com/api/Orders/Getallorder"),
    headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
  );
  final responseJson = jsonDecode(response.body);
  //print(responseJson);
  return ListOrders.fromJson(responseJson);
}

Future UpdateOrder(orderID, packageOrderID, slotID, collectionID) async {
  var response = await http.put(
      Uri.parse("http://www.subcriptionmilk.somee.com/api/Orders/update"),
      headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
      body:
      jsonEncode({
        "id": orderID,
        "pacakeOrderId": packageOrderID,
        "slotId": slotID,
        "collectionId": collectionID,
        "day": "2022-06-22T00:00:00" // chua lam :(
      })
  );
  final responseJson = jsonDecode(response.body);
  print(responseJson);
}

//Collection

Future <ListCollection> FetchCollection() async {
  var response = await http.get(
    Uri.parse("http://www.subcriptionmilk.somee.com/api/Collections"),
    headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
  );
  final responseJson = jsonDecode(response.body);
  print("responseJson");
  print(responseJson);
  return ListCollection.fromJson(responseJson);
}

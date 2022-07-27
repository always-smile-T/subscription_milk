// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'list_orders.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)

class ListOrders {
  int? statusCode;
  String? message;
  List<Datas>? data;

  ListOrders({this.statusCode, this.message, this.data});

  factory ListOrders.fromJson(Map<String, dynamic> json) => _$ListOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrdersToJson(this);
}
@JsonSerializable()
class Datas {
  int? id;
  int? pacakeOrderId;
  int? slotId;
  int? collectionId;
  int? deliveryTripId;
  String? day;
  String? status;
  /*Null? deliveryTrip;
  Null? pacakeOrder;
  Null? station;
  List<Null>? orderDetails;*/

  Datas(
      {this.id,
        this.pacakeOrderId,
        this.slotId,
        this.collectionId,
        this.deliveryTripId,
        this.day,
        this.status,
        /*this.deliveryTrip,
        this.pacakeOrder,
        this.station,
        this.orderDetails*/});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}

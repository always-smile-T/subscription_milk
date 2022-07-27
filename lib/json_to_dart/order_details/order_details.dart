// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)

class OrderDetails {
  int? statusCode;
  String? message;
  List<Data>? data;

  OrderDetails({this.statusCode, this.message, this.data});

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
@JsonSerializable()
class Data {
  int? productId;
  int? orderId;
  int? amount;
  int? price;
  /*Null? order;
  Null? product;*/

  Data(
      {this.productId,
        this.orderId,
        this.amount,
        this.price,
        /*this.order,
        this.product*/});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

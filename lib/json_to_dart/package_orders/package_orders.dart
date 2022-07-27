// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'package_orders.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)

class PackageOrderss {
  int? statusCode;
  String? message;
  List<Dataa>? data;
  int? totalitems;

  PackageOrderss({this.statusCode, this.message, this.data, this.totalitems});
  factory PackageOrderss.fromJson(Map<String, dynamic> json) => _$PackageOrderssFromJson(json);

  Map<String, dynamic> toJson() => _$PackageOrderssToJson(this);

}
@JsonSerializable()
class Dataa {
  int? id;
  String? startTime;
  String? endTime;
  String? fullName;
  int? stationId;
  String? phone;
  String? email;
  String? description;
  int? paymentId;
  int? customerId;
  int? packageId;
  int? total;

  Dataa(
      {this.id,
        this.startTime,
        this.endTime,
        this.fullName,
        this.stationId,
        this.phone,
        this.email,
        this.description,
        this.paymentId,
        this.customerId,
        this.packageId,
        this.total});

  factory Dataa.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

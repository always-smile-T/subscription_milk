// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'list_slots.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)
class ListStation {
  int? statusCode;
  String? message;
  List<Data>? data;
  int? totalitems;

  ListStation({this.statusCode, this.message, this.data, this.totalitems});

  factory ListStation.fromJson(Map<String, dynamic> json) => _$ListStationFromJson(json);

  Map<String, dynamic> toJson() => _$ListStationToJson(this);
}
@JsonSerializable()
class Data {
  int? id;
  String? title;
  String? address;
  String? description;
  int? slotId;
  /*Null? station;
  List<Null>? accounts;
  List<Null>? deliveryTrips;
  List<Null>? workings;*/

  Data(
      {this.id,
        this.title,
        this.address,
        this.description,
        this.slotId,
        /*this.station,
        this.accounts,
        this.deliveryTrips,
        this.workings*/});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

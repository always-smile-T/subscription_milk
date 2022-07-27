import 'package:json_annotation/json_annotation.dart';

part 'info_only.g.dart';

@JsonSerializable()
class Info {
  int? statusCode;
  String? message;
  List<Data>? data;

  Info({this.statusCode, this.message, this.data});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? email;
  String? password;
  String? fullname;
  String? phone;
  bool? gender;
  String? address;
  int? stationId;
  String? avatar;
  bool? isAdmin;
  String? station;
  List<String>? packageOrders;

  Data(
      {this.id,
        this.email,
        this.password,
        this.fullname,
        this.phone,
        this.gender,
        this.address,
        this.stationId,
        this.avatar,
        this.isAdmin,
        this.station,
        this.packageOrders});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
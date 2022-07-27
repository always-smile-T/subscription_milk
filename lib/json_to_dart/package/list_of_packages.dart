import 'package:json_annotation/json_annotation.dart';

part 'list_of_packages.g.dart';
//run (flutter pub run build_runner build)
@JsonSerializable(explicitToJson: true)

class ListOfPackages {
  int? statusCode;
  String? message;
  List<Data>? data;

  ListOfPackages({this.statusCode, this.message, this.data});

  factory ListOfPackages.fromJson(Map<String, dynamic> json) => _$ListOfPackagesFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfPackagesToJson(this);
}
@JsonSerializable()
class Data {
  int? id;
  String? img;
  String? title;
  String? description;
  int? price;

  Data({this.id, this.img, this.title, this.description, this.price});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

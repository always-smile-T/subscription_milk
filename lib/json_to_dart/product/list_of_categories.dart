// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'list_of_categories.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)


class ListCategories {
  int? statusCode;
  String? message;
  List<Data>? data;

  ListCategories({this.statusCode, this.message, this.data});

  factory ListCategories.fromJson(Map<String, dynamic> json) => _$ListCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoriesToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? img;
  String? title;
  String? description;
  String? active;

  Data({this.id, this.img, this.title, this.description, this.active});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
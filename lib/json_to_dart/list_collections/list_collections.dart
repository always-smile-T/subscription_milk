// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'list_collections.g.dart';
//run (flutter pub run build_runner build)

@JsonSerializable(explicitToJson: true)
class ListCollection {
  int? id;
  int? productId;
  String? description;
  //List<Null>? packageItems;
  //List<Null>? productInCollections;

  ListCollection(
      {this.id,
        this.productId,
        this.description,
        //this.packageItems,
        //this.productInCollections
      });

   // đổi thành List<dynamic>
  factory ListCollection.fromJson(Map<String, dynamic> json) => _$ListCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$ListCollectionToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCollection _$ListCollectionFromJson(Map<String, dynamic> json) =>
    ListCollection(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ListCollectionToJson(ListCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'description': instance.description,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_packages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfPackages _$ListOfPackagesFromJson(Map<String, dynamic> json) =>
    ListOfPackages(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOfPackagesToJson(ListOfPackages instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      img: json['img'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_slots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStation _$ListStationFromJson(Map<String, dynamic> json) => ListStation(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalitems: json['totalitems'] as int?,
    );

Map<String, dynamic> _$ListStationToJson(ListStation instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'totalitems': instance.totalitems,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      slotId: json['slotId'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'description': instance.description,
      'slotId': instance.slotId,
    };

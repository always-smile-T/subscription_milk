// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOrders _$ListOrdersFromJson(Map<String, dynamic> json) => ListOrders(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOrdersToJson(ListOrders instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      id: json['id'] as int?,
      pacakeOrderId: json['pacakeOrderId'] as int?,
      slotId: json['slotId'] as int?,
      collectionId: json['collectionId'] as int?,
      deliveryTripId: json['deliveryTripId'] as int?,
      day: json['day'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'id': instance.id,
      'pacakeOrderId': instance.pacakeOrderId,
      'slotId': instance.slotId,
      'collectionId': instance.collectionId,
      'deliveryTripId': instance.deliveryTripId,
      'day': instance.day,
      'status': instance.status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageOrderss _$PackageOrderssFromJson(Map<String, dynamic> json) =>
    PackageOrderss(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Dataa.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalitems: json['totalitems'] as int?,
    );

Map<String, dynamic> _$PackageOrderssToJson(PackageOrderss instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'totalitems': instance.totalitems,
    };

Dataa _$DataFromJson(Map<String, dynamic> json) => Dataa(
      id: json['id'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      fullName: json['fullName'] as String?,
      stationId: json['stationId'] as int?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      paymentId: json['paymentId'] as int?,
      customerId: json['customerId'] as int?,
      packageId: json['packageId'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$DataToJson(Dataa instance) => <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fullName': instance.fullName,
      'stationId': instance.stationId,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'paymentId': instance.paymentId,
      'customerId': instance.customerId,
      'packageId': instance.packageId,
      'total': instance.total,
    };

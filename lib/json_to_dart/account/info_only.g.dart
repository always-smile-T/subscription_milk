// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_only.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as bool?,
      address: json['address'] as String?,
      stationId: json['stationId'] as int?,
      avatar: json['avatar'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      station: json['station'] as String?,
      packageOrders: (json['packageOrders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'gender': instance.gender,
      'address': instance.address,
      'stationId': instance.stationId,
      'avatar': instance.avatar,
      'isAdmin': instance.isAdmin,
      'station': instance.station,
      'packageOrders': instance.packageOrders,
    };

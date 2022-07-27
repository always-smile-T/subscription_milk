// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      productId: json['productId'] as int?,
      orderId: json['orderId'] as int?,
      amount: json['amount'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'productId': instance.productId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'price': instance.price,
    };

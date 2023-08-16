// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrder _$UserOrderFromJson(Map<String, dynamic> json) => UserOrder(
      id: json['id'] as int?,
      uid: json['uid'] as String,
      total: (json['total'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$UserOrderToJson(UserOrder instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'total': instance.total,
      'discount': instance.discount,
    };

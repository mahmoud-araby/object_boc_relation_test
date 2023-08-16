// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      orders: toManyOrder(json['orders'] as List),
      uid: json['uid'] as String,
      name: json['name'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'notes': instance.notes,
      'orders': instance.orders,
    };

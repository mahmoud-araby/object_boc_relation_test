import 'package:json_annotation/json_annotation.dart';
import 'package:object_boc_relation_test/models/order.dart';
import 'package:objectbox/objectbox.dart';

part "user.g.dart";

ToMany<UserOrder> toManyOrder(List data) =>
    ToMany(items: data.map((e) => UserOrder.fromJson(e)).toList());

@JsonSerializable(createToJson: false)
@Entity()
class User {
  int? id;
  @Unique(onConflict: ConflictStrategy.replace)
  String uid;
  String name;
  String notes;
  @JsonKey(fromJson: toManyOrder)
  @Backlink('user')
  ToMany<UserOrder> orders = ToMany<UserOrder>();

  User({
    this.id,
    required this.orders,
    required this.uid,
    required this.name,
    required this.notes,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

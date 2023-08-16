import 'package:json_annotation/json_annotation.dart';
import 'package:object_boc_relation_test/models/user.dart';
import 'package:objectbox/objectbox.dart';

part "order.g.dart";

toOneUser(Map<String, dynamic> data) => ToOne(target: User.fromJson(data));

@JsonSerializable()
@Entity()
class UserOrder {
  int? id;
  @Unique(onConflict: ConflictStrategy.replace)
  String uid;
  double total;
  double discount;
  @JsonKey(includeFromJson: false)
  ToOne<User> user = ToOne<User>();

  UserOrder({
    this.id,
    required this.uid,
    required this.total,
    required this.discount,
  });

  factory UserOrder.fromJson(Map<String, dynamic> json) =>
      _$UserOrderFromJson(json);
}

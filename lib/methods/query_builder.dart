import 'dart:developer';

import 'package:object_boc_relation_test/main.dart';

import '../models/order.dart';
import '../objectbox.g.dart';

class DbBuilder {
  List<UserOrder> userOrders(String userName, double price, double discount) {
    Box<UserOrder> userOrderBox = store.box<UserOrder>();

    QueryBuilder<UserOrder> queryBuilder = userOrderBox.query(UserOrder_.total
        .greaterOrEqual(price)

        /// TODO : try to change this or to and it will work fine but using or not working correctly
        .or(UserOrder_.discount.greaterOrEqual(discount)));

    queryBuilder.link(UserOrder_.user, User_.name.contains(userName));

    Query<UserOrder> query = queryBuilder.build();
    log(query.describeParameters(), name: "Query Describe Parameters");
    log(query.describe(), name: "Query Describe");
    List<UserOrder> ret = query.find();
    query.close();
    return ret;
  }
}

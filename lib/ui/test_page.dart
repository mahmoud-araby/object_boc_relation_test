import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:object_boc_relation_test/models/order.dart';

import '../methods/query_builder.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController name = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController discount = TextEditingController();
  final DbBuilder dbBuilder = DbBuilder();
  List<UserOrder> orders = [];

  _searchForData() {
    orders = dbBuilder.userOrders(name.text, double.tryParse(total.text) ?? 0,
        double.tryParse(discount.text) ?? 0);

    setState(() {});
  }

  @override
  void dispose() {
    name.dispose();
    total.dispose();
    discount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            _searchHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) => _cardResult(orders[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _searchHeader() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: total,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (_) => _searchForData(),
            decoration: const InputDecoration(
              labelText: "Total",
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(" AND "),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: discount,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (_) => _searchForData(),
            decoration: const InputDecoration(
              labelText: "Discount",
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(" LINK "),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: name,
            onChanged: (_) => _searchForData(),
            decoration: const InputDecoration(
              labelText: "User Name",
            ),
          ),
        ),
      ],
    );
  }

  _cardResult(UserOrder order) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Total : ${order.total}"),
              Text("Discount : ${order.discount}"),
              Text(
                order.user.target?.name ?? "---",
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      );
}

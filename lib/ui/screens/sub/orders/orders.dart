import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/widgets/orders/order_widget.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).accentColor))
            .tr(),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return OrderWidget();
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: 6),
    );
  }
}

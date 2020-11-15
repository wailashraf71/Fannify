import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/dialogs/order_review_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OrderSummary extends StatelessWidget {
  final bool previewWithAccept;
  final bool sendOrder;

  const OrderSummary({
    Key key,
    this.previewWithAccept = false,
    this.sendOrder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('Order Summary',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).accentColor))
            .tr(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Service id',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor),
                        ).tr(),
                        SizedBox(width: 5),
                        Text(
                          '#14276',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    buildData(
                        context: context,
                        key: 'Service Type',
                        value: 'Plumbing'),
                    buildData(
                        context: context,
                        key: 'How many services',
                        value: 'x2'),
                    Divider(),
                    buildData(
                        context: context, key: 'Location', value: 'Baghdad'),
                    buildData(
                        context: context,
                        key: 'Visit time',
                        value: '4:30PM - 5:15PM'),
                    Divider(),
                    buildData(
                        context: context, key: 'Total Price', value: '\$20'),
                    buildData(
                        context: context, key: 'Fannify Tax', value: '-\$4'),
                    buildData(
                        context: context, key: 'Your Revenue', value: '\$16')
                  ],
                ),
              ),
            ),
          ),
          if (sendOrder)
            Align(
                alignment:
                    EasyLocalization.of(context).locale == Locale('ar', 'IQ')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                      width: 200,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.9),
                            blurRadius: 10,
                            spreadRadius: -7)
                      ], borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FlatButton(
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            onPressed: () => orderReviewDialog(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Place Order",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            height: 1.1,
                                            fontWeight: FontWeight.w700))
                                    .tr(),
                                SizedBox(width: 10),
                                Icon(
                                  FeatherIcons.checkSquare,
                                  color: Theme.of(context).accentColor,
                                )
                              ],
                            )),
                      )),
                )),
          if (previewWithAccept)
            Align(
                alignment:
                    EasyLocalization.of(context).locale == Locale('ar', 'IQ')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CupertinoButton(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(22),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Accept order",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800))
                                        .tr(),
                                    SizedBox(width: 5),
                                    Icon(FeatherIcons.checkSquare, size: 18)
                                  ],
                                )),
                          )),
                      SizedBox(height: 15),
                      Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CupertinoButton(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color
                                    .withOpacity(0.03),
                                padding: EdgeInsets.all(20),
                                onPressed: () {},
                                child: Text("Cancel",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w800))
                                    .tr()),
                          )),
                    ],
                  ),
                ))
        ],
      ),
    );
  }

  Widget buildData({BuildContext context, String key, String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                key,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .textTheme
                        .headline1
                        .color
                        .withOpacity(0.6)),
              ).tr(),
              Text(' :',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.6))),
            ],
          ),
          SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

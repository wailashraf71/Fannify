import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/widgets/services/service_provider_card.dart';
import 'package:fannify/ui/screens/sub/orders/order_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ServiceOrdering extends StatefulWidget {
  @override
  _ServiceOrderingState createState() => _ServiceOrderingState();
}

class _ServiceOrderingState extends State<ServiceOrdering> {
  String location;
  String visitTime;

  int serviceCount = 1;
  int providerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Order',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    height: 1.8,
                    fontWeight: FontWeight.w700))
            .tr(),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 3.0,
            animationDuration: 1000,
            percent: 0.2,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Theme.of(context).accentColor,
            backgroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Select service provider',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ).tr(),
                  ),
                  SizedBox(height: 10),
                  AnimationLimiter(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [1, 2, 3, 4, 5, 6, 7, 8]
                          .map((item) => CupertinoButton(
                              onPressed: () => setState(() {
                                    providerId = item;
                                  }),
                              padding: EdgeInsets.zero,
                              child: ServiceProviderCard(
                                id: item,
                                checked: providerId == item,
                                online: item < 5,
                                distance: item + (item * 0.28),
                              )))
                          .toList()
                          .cast<Widget>(),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
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
                          onPressed: () => Get.to(OrderSummary(
                                sendOrder: true,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Checkout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 1.1,
                                          fontWeight: FontWeight.w700))
                                  .tr(),
                              SizedBox(width: 10),
                              Icon(
                                EasyLocalization.of(context).locale ==
                                        Locale('ar', 'IQ')
                                    ? FeatherIcons.arrowLeft
                                    : FeatherIcons.arrowRight,
                                color: Theme.of(context).accentColor,
                              )
                            ],
                          )),
                    )),
              ))
        ],
      ),
    );
  }
}

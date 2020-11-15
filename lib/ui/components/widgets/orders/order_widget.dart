import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/screens/sub/orders/order_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OrderWidget extends StatelessWidget {
  final bool preview;

  const OrderWidget({Key key, this.preview = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return OrderSummary(previewWithAccept: preview ? false : true);
          }),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(color: Colors.white),
                        child: CachedNetworkImage(
                          imageUrl: '',
                          // imageUrl: 'https://www.lolichheatandair.com/wp-content/uploads/2020/02/AdobeStock_290366802-1024x683.jpeg',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 85.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Service Type',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color
                                        .withOpacity(0.56)),
                              ).tr(),
                              SizedBox(width: 5),
                              Text('x2',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text('New york, 43801',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.35))),
                          SizedBox(height: 3),
                          Text('4:30 PM  to  5:15 PM',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.35))),
                          SizedBox(height: 2),
                          Text('13.7 km away',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.35))),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!preview) SizedBox(height: 15),
                if (!preview)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CupertinoButton(
                                  color: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.all(15),
                                  onPressed: () => showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return OrderSummary(
                                          previewWithAccept: true,
                                        );
                                      }),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("View order",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800))
                                          .tr(),
                                      SizedBox(width: 5),
                                      Icon(FeatherIcons.eye, size: 18)
                                    ],
                                  )),
                            )),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CupertinoButton(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.03),
                                  padding: EdgeInsets.all(18),
                                  onPressed: () {},
                                  child: Text("Cancel",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w800))
                                      .tr()),
                            )),
                      ),
                    ],
                  ),
              ],
            ),
          )),
    );
  }
}

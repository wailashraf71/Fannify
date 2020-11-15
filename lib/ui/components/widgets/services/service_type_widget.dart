import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/screens/sub/services/service_ordering_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceTypeWidget extends StatelessWidget {
  final String title;
  final bool fixedPrice;
  final bool bigSize;

  const ServiceTypeWidget({
    Key key,
    this.title,
    this.fixedPrice,
    this.bigSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Get.to(ServiceOrderingMap()),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: -7)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Container(
                height: bigSize ? 100.0 : 70.0,
                width: bigSize ? 100.0 : 70.0,
                decoration: BoxDecoration(color: Colors.white),
                child: CachedNetworkImage(
                  imageUrl: '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.black12,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.7)),
                      ),
                      if (fixedPrice)
                        Text(
                          'Fixed Price',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.9)),
                        ).tr(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

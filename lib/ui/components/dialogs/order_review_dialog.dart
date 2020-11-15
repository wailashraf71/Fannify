import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/screens/sub/services/service_ordering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void orderReviewDialog(BuildContext context) => showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Review',
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.headline1.color),
                  ).tr(),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      'Please tell us how much did you pay',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ).tr(),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: -7)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      decoration: InputDecoration(
                          hintText: tr('Enter number'),
                          hintStyle: TextStyle(fontSize: 12),
                          border: InputBorder.none,
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  SizedBox(height: 5),
                  Text(
                    'Rate our service',
                    style: TextStyle(
                        fontSize: 12,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.headline1.color),
                  ).tr(),
                  SizedBox(height: 10),
                  SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: 0,
                      size: 40.0,
                      color: Color(0xffFFC312).withOpacity(0.9),
                      borderColor: Color(0xffFFC312).withOpacity(0.8),
                      spacing: 0.0),
                  SizedBox(height: 15),
                  Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CupertinoButton(
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.all(18),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Finish & Send",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800))
                                    .tr(),
                                SizedBox(width: 5),
                                Icon(FeatherIcons.checkSquare, size: 18)
                              ],
                            )),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );

CupertinoButton serviceType(int index, BuildContext context, bool fixedPrice) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () => Get.to(ServiceOrdering()),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(color: Colors.white),
              child: CachedNetworkImage(
                imageUrl: '',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service Type ${index + 1}',
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.9)),
                    ).tr(),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

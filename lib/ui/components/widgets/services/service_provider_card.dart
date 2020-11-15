import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ServiceProviderCard extends StatelessWidget {
  final int id;
  final bool checked;
  final bool online;
  final double distance;

  const ServiceProviderCard(
      {Key key,
      this.id,
      this.checked = false,
      this.online = false,
      this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: id,
      duration: const Duration(milliseconds: 675),
      child: FadeInAnimation(
        child: AnimatedContainer(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: checked
                  ? Theme.of(context).primaryColor.withOpacity(1)
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: -7)
              ],
              borderRadius: BorderRadius.circular(10)),
          duration: Duration(milliseconds: 150),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black.withOpacity(0.07), width: 2.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                  if (online)
                    Container(
                      height: 44.0,
                      width: 44.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              color: Colors.green,
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: checked
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothStarRating(
                              allowHalfRating: false,
                              isReadOnly: true,
                              starCount: 5,
                              rating: 4,
                              size: 16.0,
                              color: Color(0xffFFC312),
                              borderColor: Color(0xffFFC312),
                              spacing: 0.0),
                          if (distance != null)
                            Text(
                              '30 km',
                              style: TextStyle(
                                color: checked
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color
                                        .withOpacity(0.3),
                                fontSize: 11,
                              ),
                            ).tr(args: ['$distance']),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

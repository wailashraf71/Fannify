import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/screens/sub/services/service_ordering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ServiceOrderingMap extends StatefulWidget {
  @override
  _ServiceOrderingMapState createState() => _ServiceOrderingMapState();
}

class _ServiceOrderingMapState extends State<ServiceOrderingMap> {
  String location;
  String visitTime;

  int serviceCount = 1;
  int providerId;

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  String mapStyle =
      ''' [ { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#e9e9e9" }, { "lightness": 17 } ] }, { "featureType": "landscape", "elementType": "geometry", "stylers": [ { "color": "#f5f5f5" }, { "lightness": 20 } ] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [ { "color": "#ffffff" }, { "lightness": 17 } ] }, { "featureType": "road.highway", "elementType": "geometry.stroke", "stylers": [ { "color": "#ffffff" }, { "lightness": 29 }, { "weight": 0.2 } ] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [ { "color": "#ffffff" }, { "lightness": 18 } ] }, { "featureType": "road.local", "elementType": "geometry", "stylers": [ { "color": "#ffffff" }, { "lightness": 16 } ] }, { "featureType": "poi", "elementType": "geometry", "stylers": [ { "color": "#f5f5f5" }, { "lightness": 21 } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "color": "#dedede" }, { "lightness": 21 } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "visibility": "on" }, { "color": "#ffffff" }, { "lightness": 16 } ] }, { "elementType": "labels.text.fill", "stylers": [ { "saturation": 36 }, { "color": "#333333" }, { "lightness": 40 } ] }, { "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "featureType": "transit", "elementType": "geometry", "stylers": [ { "color": "#f2f2f2" }, { "lightness": 19 } ] }, { "featureType": "administrative", "elementType": "geometry.fill", "stylers": [ { "color": "#fefefe" }, { "lightness": 20 } ] }, { "featureType": "administrative", "elementType": "geometry.stroke", "stylers": [ { "color": "#fefefe" }, { "lightness": 17 }, { "weight": 1.2 } ] } ] ''';

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.322478, 44.351588),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your location',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Location
                Container(
                  height: 500,
                  child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    markers: _markers,
                    buildingsEnabled: true,
                    compassEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      controller.setMapStyle(mapStyle);
                      _controller.complete(controller);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Visit Time
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Preferred visit time',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ).tr(),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).nextFocus();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: tr('4:30 PM'),
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('to').tr(),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
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
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).nextFocus();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: tr('5:45 PM'),
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      //Services Count
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'How many services',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ).tr(),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 150,
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
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () => setState(() {
                                  if (serviceCount != 1) serviceCount--;
                                }),
                                child: Icon(
                                  FeatherIcons.minus,
                                  size: 20,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Center(
                                    child: Text(
                              serviceCount.toString(),
                              style: TextStyle(fontSize: 16),
                            ))),
                            Container(
                              width: 50,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () => setState(() => serviceCount++),
                                child: Icon(
                                  FeatherIcons.plus,
                                  size: 20,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )
              ],
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
                          onPressed: () => Get.to(ServiceOrdering()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Continue",
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

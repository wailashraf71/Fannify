import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/widgets/orders/order_widget.dart';
import 'package:fannify/ui/components/widgets/pin_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceProviderHome extends StatefulWidget {
  @override
  _ServiceProviderHomeState createState() => _ServiceProviderHomeState();
}

PinInformation currentlySelectedPin = PinInformation(
    pinPath: '',
    avatarPath: '',
    location: LatLng(0, 0),
    locationName: '',
    labelColor: Colors.grey);
PinInformation sourcePinInfo;
PinInformation destinationPinInfo;

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  bool online = false;
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
  void initState() {
    setSourceAndDestinationIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 150,
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
                  setMapPins();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CupertinoButton(
              onPressed: () => setState(() {
                online = !online;
              }),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              color: online
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.5),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          online ? 'Online' : 'Offline',
                          style: TextStyle(
                              fontSize: 15,
                              color: online
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.5),
                              fontWeight: FontWeight.w700),
                        ).tr(),
                      ],
                    ),
                  )),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: OrderWidget(preview: false),
              ))
        ],
      ),
    );
  }

  void setMapPins() {
    // add the source marker to the list of markers
    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: LatLng(33.322478, 44.351588),
        icon: sourceIcon));
    // populate the sourcePinInfo object
    sourcePinInfo = PinInformation(
        locationName: 'Start Location',
        location: LatLng(36.3523821, 43.1586923),
        pinPath: 'assets/images/png/pin.png',
        avatarPath: 'assets/images/png/pin.png',
        labelColor: Colors.blueAccent);
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 12, size: Size(10, 30)),
        'assets/images/png/pin.png');
  }
}

import 'package:fannify/ui/screens/sub/services/services_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceWidget extends StatefulWidget {
  final String title;
  final String assetImage;

  const ServiceWidget({Key key, this.title, this.assetImage}) : super(key: key);

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Get.to(ServicesTypes()),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 5)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 50,
                height: 55,
                child: Image.asset(
                  widget.assetImage,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.title,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 11),
          )
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/dummy_data.dart';
import 'package:fannify/ui/components/widgets/services/service_widget.dart';
import 'package:flutter/material.dart';

class GridOfServices extends StatefulWidget {
  @override
  _GridOfServicesState createState() => _GridOfServicesState();
}

class _GridOfServicesState extends State<GridOfServices> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return EasyLocalization.of(context).locale == Locale('ar', 'IQ')
              ? ServiceWidget(
                  title: servicesArabic[index]['title'],
                  assetImage: servicesArabic[index]['image'],
                )
              : ServiceWidget(
                  title: services[index]['title'],
                  assetImage: services[index]['image'],
                );
        });
  }
}

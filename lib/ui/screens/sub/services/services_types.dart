import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/widgets/services/service_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Choose type of service',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      height: 1.8,
                      fontWeight: FontWeight.w700))
              .tr(),
          centerTitle: true,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Container(),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15),
            SizedBox(height: 5),
            ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ServiceTypeWidget(
                    title: 'Service Type ${index + 1}',
                    fixedPrice: index == 0,
                    bigSize: true,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15);
                },
                itemCount: 3),
          ],
        ),
      ),
    );
  }
}

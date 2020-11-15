import 'package:fannify/ui/components/widgets/search/search_bar.dart';
import 'package:fannify/ui/components/widgets/services/service_type_widget.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          preview: false,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ServiceTypeWidget(
            title: 'Service Type ${index + 1}',
            fixedPrice: index == 0,
            bigSize: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }
}

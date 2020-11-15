import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const DotsIndicator({Key key, this.controller, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SmoothPageIndicator(
            controller: controller,
            count: count,
            effect: ExpandingDotsEffect(
              dotColor: Colors.black12,
              activeDotColor: Theme.of(context).primaryColor,
              dotWidth: 8,
              dotHeight: 8,
              paintStyle: PaintingStyle.fill,
            )));
  }
}

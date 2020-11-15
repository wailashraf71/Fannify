import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/dummy_data.dart';
import 'package:fannify/ui/components/widgets/dots_indicator.dart';
import 'package:fannify/ui/components/widgets/services/grid_of_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final ScrollController scrollController;

  const Home({Key key, this.scrollController}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _carouselController;

  @override
  void initState() {
    _carouselController = PageController(viewportFraction: 0.95);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: SearchBar(preview: true),
            // ),
            Column(
              children: [
                Container(
                    height: 300,
                    child: buildCarouselSlider(_carouselController)),
                Container(
                  // height: 165,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DotsIndicator(
                        controller: _carouselController, count: slides.length),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            GridOfServices(),
          ],
        ),
      ),
    );
  }

  ///Widgets
  Widget buildCarouselSlider(PageController carouselController) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: carouselController,
      itemCount: slides.length,
      itemBuilder: (BuildContext context, int index) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05), blurRadius: 10)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          imageUrl: slides[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Top new offers',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              .color
                              .withOpacity(0.78)),
                    ).tr(),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua.',
                      style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              .color
                              .withOpacity(0.36)),
                    ).tr(),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

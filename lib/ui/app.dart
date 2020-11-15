import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/components/widgets/search/search_bar.dart';
import 'package:fannify/ui/screens/auth/login.dart';
import 'package:fannify/ui/screens/home.dart';
import 'package:fannify/ui/screens/service_provider_home.dart';
import 'package:fannify/ui/screens/sub/accounts/user_account.dart';
import 'package:fannify/ui/screens/sub/orders/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class App extends StatefulWidget {
  final bool serviceProvider;

  const App({Key key, this.serviceProvider = false}) : super(key: key);

  @override
  _App createState() => new _App();
}

class _App extends State<App> {
  ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController = new ScrollController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xff22AAA1),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xffffffff),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: buildDrawer(context),
        appBar: CustomAppBar(
          serviceProvider: widget.serviceProvider,
          onTap: () => scrollUp(_scrollController),
          appBar: AppBar(
            title: Text(
              'Fannify',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline1.color,
                  fontFamily:
                      Theme.of(context).primaryTextTheme.headline1.fontFamily,
                  fontSize: 24),
            ).tr(),
            centerTitle: true,
            brightness: Brightness.dark,
            elevation: 0,
            leading: IconButton(
              icon: Icon(FeatherIcons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            actions: [
              IconButton(
                icon: Icon(FeatherIcons.user),
                onPressed: () => Get.to(UserAccount()),
              ),
            ],
            bottom: widget.serviceProvider
                ? null
                : PreferredSize(
                    preferredSize: Size.fromHeight(100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: SearchBar(),
                    ),
                  ),
          ),
        ),
        body: widget.serviceProvider
            ? ServiceProviderHome()
            : Home(
                scrollController: _scrollController,
              ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.05),
                          child: Icon(
                            FeatherIcons.image,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fannify',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .color,
                            fontFamily: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .fontFamily,
                            fontSize: 30),
                      ).tr()
                    ],
                  ),
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.settings, size: 18),
                      SizedBox(width: 10),
                      Text('Translate',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () {
                    EasyLocalization.of(context).locale == Locale('ar', 'IQ')
                        ? EasyLocalization.of(context).locale =
                            Locale('en', 'US')
                        : EasyLocalization.of(context).locale =
                            Locale('ar', 'IQ');
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.aperture, size: 18),
                      SizedBox(width: 10),
                      Text('Service Provider Home',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () => Get.to(App(serviceProvider: true)),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.checkSquare, size: 18),
                      SizedBox(width: 10),
                      Text('My Orders',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () => Get.to(Orders()),
                ),
                Divider(),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.logIn, size: 18),
                      SizedBox(width: 10),
                      Text('Login',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () => Get.to(Login()),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.clipboard, size: 18),
                      SizedBox(width: 10),
                      Text('Terms & conditions',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () => launch('www.meow.com'),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(FeatherIcons.info, size: 18),
                      SizedBox(width: 10),
                      Text('About us',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700))
                          .tr(),
                    ],
                  ),
                  onTap: () => launch('www.meow.com'),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(50),
              child: Text('Version 1.0.0',
                  style: TextStyle(color: Colors.black12)))
        ],
      ),
    );
  }

  void scrollUp(ScrollController scrollController) {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 320),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;
  final bool serviceProvider;

  const CustomAppBar({Key key, this.onTap, this.appBar, this.serviceProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => new Size.fromHeight(serviceProvider ? 60 : 120);
}

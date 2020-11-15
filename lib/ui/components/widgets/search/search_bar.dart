import 'package:easy_localization/easy_localization.dart';
import 'package:fannify/ui/screens/sub/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool preview;

  const SearchBar({Key key, this.searchController, this.preview = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 45.0,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  FeatherIcons.search,
                  color: Theme.of(context)
                      .textTheme
                      .headline1
                      .color
                      .withOpacity(0.38),
                  size: 20,
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: preview ? false : true,
                    decoration: new InputDecoration(
                      hintText: tr('search_hint'),
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline1
                              .color
                              .withOpacity(0.38),
                          fontSize: 13),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 10, right: 10, bottom: 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (preview)
            CupertinoButton(
              onPressed: () => Get.to(Search(), transition: Transition.fadeIn),
              child: Container(),
            ),
        ],
      ),
    );
  }
}

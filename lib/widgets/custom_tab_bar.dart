import 'package:clone_facbook/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectIndex,
      required this.onTap})
      : super(key: key);

  final List<IconData> icons;
  final int selectIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border:
              Border(top: BorderSide(color: Palette.facebookBlue, width: 3))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color:
                      i == selectIndex ? Palette.facebookBlue : Colors.black45,
                  size: 30,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget DesktopScreen;
  final Widget TabletScreen;
  final Widget MobileScreen;

  const ResponsiveLayout(
      {Key key ,
        @required this.DesktopScreen,
        this.TabletScreen,
        this.MobileScreen})
      : super(key :key);

  static bool isMobileScreen (BuildContext context){
    return MediaQuery.of(context).size.width < 800 ;
  }

  static bool isTabletScreen(BuildContext context){
    return MediaQuery.of(context).size.width > 800 && MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktopScreen (BuildContext context){
    return MediaQuery.of(context).size.width > 800 ;
  }

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return TabletScreen ?? DesktopScreen;
        } else {
          return MobileScreen ?? DesktopScreen;
        }
      },
    );
  }

}


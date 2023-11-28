import 'package:flutter/material.dart';
import 'package:flutter_application_/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:flutter_application_/widgets/navigation_bar/navigationbr_tabledekstop.dart';
import 'package:responsive_builder/responsive_builder.dart';
class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationbrMobile(),
      desktop:TableNavigationbr() ,
    );
  }
}
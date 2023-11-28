import 'package:flutter/material.dart';
class CenterView extends StatelessWidget {
  final Widget child;
   CenterView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 1200),
      child: child,
      )
      ,
    );
  }
}
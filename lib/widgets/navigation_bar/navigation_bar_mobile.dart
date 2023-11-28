import 'package:flutter/material.dart';
class NavigationbrMobile extends StatelessWidget {
  const NavigationbrMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child:  const Row(
       mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        IconButton(onPressed: null, icon: Icon(Icons.menu)),
        SizedBox(height: 30,),
        Text('data')
        ],
      ),
    );
  }
}
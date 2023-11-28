import 'package:flutter/material.dart';
class TableNavigationbr extends StatelessWidget {
  const TableNavigationbr({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
            width: 150,
            child: Text('SnabbApp')),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         Text('Bussine Detail'),
         SizedBox(width: 60,),
          Text('Bussine Detail'),
      ],),
        ],
      ),
      
    );
  }
}
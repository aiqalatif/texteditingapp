import 'package:flutter/material.dart';
class CallToAction extends StatelessWidget {
  final String title;
 CallToAction({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      child:  Text(title,style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      
      ),
decoration: BoxDecoration(
  color: Colors.cyanAccent,
  borderRadius: BorderRadius.circular(5)
),
    );
  }
}
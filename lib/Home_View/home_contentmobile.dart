import 'package:flutter/material.dart';
import 'package:flutter_application_/widgets/call_to_action.dart';
import 'package:flutter_application_/widgets/course_detail.dart';
class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     const  CourseDetail(),
     const  SizedBox(height: 10,),
       CallToAction(title: 'join plan',)
    ],);
  }
}
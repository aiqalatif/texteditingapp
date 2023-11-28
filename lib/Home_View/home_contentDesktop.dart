import 'package:flutter/material.dart';
import 'package:flutter_application_/widgets/call_to_action.dart';
import 'package:flutter_application_/widgets/course_detail.dart';
class HomeContentDekstop extends StatelessWidget {
  const HomeContentDekstop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:[ 
        const CourseDetail(),
              Expanded(
                child: Center(child:
                 CallToAction(title: 'join plan',)))]);
  }
}
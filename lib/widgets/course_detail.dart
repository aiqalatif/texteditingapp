import 'package:flutter/material.dart';
class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text("Detail of Bussine summery",style: TextStyle(height: 0.6,fontSize: 20,fontWeight: FontWeight.w800),),
         SizedBox(height: 30,),
         Text("Lorem Ipsum is simply dung software like Aldus PageMaker including versions of Lorem Ipsum.",style: TextStyle(
         height: 1.7,fontSize: 16,
         
         ),
        
         maxLines: 4,
         overflow: TextOverflow.ellipsis,),
      ],),
    );
  }
}
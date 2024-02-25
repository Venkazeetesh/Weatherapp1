import 'package:flutter/material.dart';

class forescasting extends StatelessWidget{
  final IconData cloud;
  final String forecastinfo;
  final dynamic value;
  const forescasting({super.key,required this.cloud,required this.value,required this.forecastinfo});
  @override
  Widget build(BuildContext context){
    return
      Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(cloud,size: 30,),
            const SizedBox(height: 18,),
            Text("$forecastinfo",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 5,),
            Text("$value"),
          ],
        ),
      );
  }
}
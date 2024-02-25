import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

void main (){
  runApp(const Weatherapp());
}
class Weatherapp extends StatelessWidget{
  const Weatherapp ({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: weather(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
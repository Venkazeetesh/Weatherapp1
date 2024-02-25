

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/forescasting.dart';
import 'package:http/http.dart' as http;

class weather extends StatefulWidget{
  const weather ({super.key});
  @override
  State<weather> createState()=>_content();
}
class _content extends State<weather>{
  double temp=0;
  @override
  void initState() {
    getliveweather();
    super.initState();
  }

  Future getliveweather() async {
      final res=await http.get(
          Uri.parse("http://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=58e01c6cf57ef66da50086d8cd33ff9b"));
      final data=jsonDecode(res.body);
      return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              getliveweather();
            });
          }, icon:Icon(Icons.refresh)),
        ],
      ),
      body:FutureBuilder(
        future: getliveweather(),
        builder:(context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          final data=snapshot.data;
           final temp=data['list'][0]['main']['temp'];
           final cloud=data['list'][1]['weather'][0]['main'];
           final humidity=data['list'][0]['main']['humidity'];
           double windspeed=data['list'][0]['wind']['speed'];
           int pressure=data['list'][0]['main']['pressure'];
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width:double.infinity,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX:20,sigmaY:20 ),
                      child:   Card(
                        elevation: 20,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("$temp",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                              const SizedBox(height: 2,),
                              Icon(cloud == "Rain" || cloud =="Cloud"?Icons.cloud:Icons.sunny,size: 60,),
                              SizedBox(height: 2),
                              Text("$cloud",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Weather forecast",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(
                height: 120,
                width: 500,
                child: ListView.builder(itemCount:10 ,scrollDirection: Axis.horizontal,itemBuilder:(context,index){
                  final time=data['list'][index+1]['dt_txt'];
                  final name=time.substring(10,16);
                  final weathers=data['list'][index+1]['weather'][0]['Clouds'];
                  final humidity=data['list'][index+1]['main']['humidity'];
                  return Hourlyforecast(name:name.toString(), weahterpic: weathers=="Clouds"||weathers=="Rain"?Icons.cloud:Icons.sunny, Humidty: humidity.toString());
                },),
              ),
            const SizedBox(height: 12,
            ),
            const Text("Additional information",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
            const SizedBox(height: 10,),
              SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  forescasting(cloud: Icons.water_drop, value: humidity, forecastinfo:"Humidty"),
                  forescasting(cloud: Icons.air, value:windspeed, forecastinfo: "Windspeed"),
                  forescasting(cloud: Icons.umbrella, value: pressure, forecastinfo: "Pressure"),
               ]
              ),
            ),
          ],
        );
        },
      ),
    );
  }
}
class Hourlyforecast extends StatelessWidget{
  final String name;
  final IconData weahterpic;
  final String Humidty;
  const Hourlyforecast({super.key,required this.name,required this.weahterpic,required this.Humidty});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 100,
        width: 100,
        child:ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5,sigmaY:5),
            child:  Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("$name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1,),
                    Icon(weahterpic,size: 30,),
                    SizedBox(height: 2,),
                    Text("$Humidty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
import 'dart:convert';

import 'package:http/http.dart' as https;
void main(){
live a=live();
print(a.getdata());
}
class live{
  Future getdata() async{
    try{
      final a=Uri.https("jsonplaceholder.typicode.com","users/1");
      final res=await https.get(a);
      final data = await jsonDecode(res.body);
     return Future.delayed(Duration(seconds: 20),(){
       print(data);
     });
    }catch(e){
      print("false");
    }
  }
}
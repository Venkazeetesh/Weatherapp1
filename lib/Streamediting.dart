import 'dart:async';

void main(){
  live a=new live();
  a.get().listen((event) {print(event);},onDone: (){
    print("Finished");
  });
}
class live{
  Stream get() async*{
    final a=StreamController();
    for(int i=0;i<5;i++){
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
    a.stream.listen((event) {print(event);},onDone: (){
      print("Finished");
    });
  }
}

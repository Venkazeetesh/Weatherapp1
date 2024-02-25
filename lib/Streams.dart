import 'package:weather/future.dart';

class Streams {
  Stream live()  {
    return Stream.periodic(Duration(microseconds: ),(val){
      return val;
    });
  }
}
void main(){
  Streams a=Streams();
  print(a.live().listen((event) {print(event);},onDone: (){
    print("Done");
  }));
  void fun(){
    print("Finished");
  }
}

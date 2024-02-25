void main(){
  String a="this one not me";
  String b="f";
  a=a[0].toUpperCase()+a.substring(1,);
  print(a);
  print(a.cpatilizate());
  print(b.cpatilizate());

}
extension nam on String{
  String cpatilizate (){
      return this[0].toUpperCase()+substring(1,);
  }
}
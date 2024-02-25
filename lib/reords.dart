void main(){
  final json={
    "eh":1,"record":34,
  };
  if(json case {
    "eh":int a,"record":int b,}){
    print(a);
    print(b);
  }else{
    print("Incorrect");
  }

}
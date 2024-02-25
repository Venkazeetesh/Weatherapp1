// void main(){
// List<String> a=["He","ho"];
// switch(a){
//   case ["He","ho"]:
//     print("Dude");
//     default:
//       print("G");
// }
// }
void main(){
  int index=2;
  int firstpage=0;
  int lastpage=1;
 final a= switch(lastpage){
    1 when index==1 => 'click',
    0=>'no',
    _=>'nope'
  };
 print(a);
}